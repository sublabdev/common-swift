import Foundation
import BigInt

public struct Int128 {
    let value: BigInt
    public static let size = 16
}

extension Int128 {
    public func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .int128))
    }
}

extension Data {
    public func int128() -> Int128 {
        Int128(value: BigInt(self))
    }
}
