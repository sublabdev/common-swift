import Foundation
import BigInt

struct Int512 {
    let value: BigInt
    static let size = 64
}

extension Int512 {
    func data() -> Data {
        value.serialize().copyOf(size: byteSize(byteSizeType: .int512))
    }
}

extension Data {
    func int512() -> Int512 {
        Int512(value: BigInt(self))
    }
}
