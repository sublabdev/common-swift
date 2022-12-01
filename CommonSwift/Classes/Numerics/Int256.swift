import Foundation
import BigInt

public struct Int256 {
    let value: BigInt
    public static let size = 32
}

extension Int256 {
    public func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .int256))
    }
}

extension Data {
    public func int256() -> Int256 {
        Int256(value: BigInt(self))
    }
}
