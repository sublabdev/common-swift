import Foundation
import BigInt

public struct UInt512 {
    let value: BigUInt
    static let size = 64
}

extension UInt512 {
    public func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .uInt512))
    }
}

extension Data {
    public func uInt512() -> UInt512 {
        UInt512(value: BigUInt(self))
    }
}
