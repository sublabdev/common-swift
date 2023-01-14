// from https://gist.github.com/sainecy/4366a1b99c7317fac63bfeb19d1cfab2
import Foundation

public final class RunBlocking<T, Failure: Error> {
    fileprivate var value: Result<T, Failure>? = nil
}

extension RunBlocking where Failure == Never {
    public func runBlocking(_ operation: @Sendable @escaping () async -> T) -> T {
        Task {
            let task = Task(operation: operation)
            self.value = await task.result
        }
        DispatchQueue.global().sync {
            while value == nil {
                RunLoop.current.run(mode: RunLoop.Mode.default, before: .distantFuture)
            }
        }
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
        Task {
            let task = Task(operation: operation)
            value = await task.result
        }
        DispatchQueue.global().sync {
            while value == nil {
                RunLoop.current.run(mode: RunLoop.Mode.default, before: .distantFuture)
            }
        }
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
