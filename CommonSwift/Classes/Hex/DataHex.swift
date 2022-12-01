import Foundation

public class DataHex {
    private let data: Data
    
    public init(data: Data) {
        self.data = data
    }
    
    public func encode(includePrefix: Bool = false) -> String {
        let encoded = data.map { String(format: "%02x", $0) }.joined()
        var prefix = ""
        
        if includePrefix {
            prefix = "0x"
        }
        
        return prefix + encoded
    }
}
