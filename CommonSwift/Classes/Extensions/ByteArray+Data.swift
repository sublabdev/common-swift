import Foundation

extension Array where Element == UInt8 {
    public func toData() -> Data {
        Data(self)
    }
}
