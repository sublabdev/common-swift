import Foundation
import BigInt

struct UInt256 {
    let value: BigUInt
    static let size = 32
}

extension UInt256 {
    func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .uInt256))
    }
}

extension Data {
    func uInt256() -> UInt256 {
        UInt256(value: BigUInt(self))
    }
}
