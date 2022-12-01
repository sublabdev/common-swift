import Foundation
import BigInt

public struct UInt128: Codable {
    let value: BigUInt
    public static let size = 16
}

extension UInt128 {
    public func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .uInt128))
    }
}

extension Data {
    public func uInt128() -> UInt128 {
        UInt128(value: BigUInt(self))
    }
}
