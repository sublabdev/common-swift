import Foundation

extension ReversedCollection<Data> {
    public func toData() -> Data {
        Data(self)
    }
}
