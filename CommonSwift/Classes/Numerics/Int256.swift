import Foundation
import BigInt

struct Int256 {
    let value: BigInt
    static let size = 32
}

extension Int256 {
    func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .int256))
    }
}

extension Data {
    func int256() -> Int256 {
        Int256(value: BigInt(self))
    }
}
