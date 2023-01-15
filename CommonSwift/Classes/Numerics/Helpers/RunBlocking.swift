/**
 *
 * Copyright 2023 SUBSTRATE LABORATORY LLC <info@sublab.dev>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0

 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */

// Modified, taken from https://gist.github.com/sainecy/4366a1b99c7317fac63bfeb19d1cfab2
import Foundation

public final class RunBlocking<T, Failure: Error> {
    fileprivate var value: Result<T, Failure>? = nil
}

extension RunBlocking where Failure == Never {
    public func runBlocking(_ operation: @Sendable @escaping () async -> T) -> T {
        let semaphore = DispatchSemaphore(value: 0)
        DispatchQueue.global(qos: .background).async {
            Task {
                self.value = await Task(operation: operation).result
                semaphore.signal()
            }
        }
        semaphore.wait()
        switch value {
        case let .success(value):
            return value
        case .none:
            fatalError("Run blocking not received value")
        }
    }
}

extension RunBlocking where Failure == Error {
    public func runBlocking(_ operation: @Sendable @escaping () async throws -> T) throws -> T {
        let semaphore = DispatchSemaphore(value: 0)
        DispatchQueue.global(qos: .background).async {
            Task {
                self.value = await Task(operation: operation).result
                semaphore.signal()
            }
        }
        semaphore.wait()
        switch value {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        case .none:
            fatalError("Run blocking not received value")
        }
    }
}

public func runBlocking<T>(@_implicitSelfCapture _ operation: @Sendable @escaping () async -> T) -> T {
    RunBlocking().runBlocking(operation)
}

public func runBlocking<T>(@_implicitSelfCapture _ operation: @Sendable @escaping () async throws -> T) throws -> T {
    try RunBlocking().runBlocking(operation)
}
