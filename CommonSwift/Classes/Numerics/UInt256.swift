import Foundation
import BigInt

public struct UInt256 {
    let value: BigUInt
    static let size = 32
}

extension UInt256 {
    public func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .uInt256))
    }
}

extension Data {
    public func uInt256() -> UInt256 {
        UInt256(value: BigUInt(self))
    }
}
