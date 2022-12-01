import Foundation
import BigInt

struct UInt128 {
    let value: BigUInt
    static let size = 16
}

extension UInt128 {
    func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .uInt128))
    }
}

extension Data {
    func uInt128() -> UInt128 {
        UInt128(value: BigUInt(self))
    }
}
