import Foundation
import BigInt

struct Int128 {
    let value: BigInt
    static let size = 16
}

extension Int128 {
    func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .int128))
    }
}

extension Data {
    func int128() -> Int128 {
        Int128(value: BigInt(self))
    }
}
