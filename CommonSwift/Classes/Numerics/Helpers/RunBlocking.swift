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
