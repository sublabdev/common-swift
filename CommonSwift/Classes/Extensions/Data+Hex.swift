import Foundation

public extension Data {
    var hex: DataHex {
        .init(data: self)
    }
}
