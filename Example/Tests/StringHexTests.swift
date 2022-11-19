import XCTest
import CommonSwift

class StringHexTests: XCTestCase {
    let randomString = "0x6d6574610e4d0c000c1c73"
    
    func testDataWithHexEncodingWithoutPrefix() {
        guard let data = getData(from: randomString) else {
            XCTFail()
            return
        }
        
        let hexString = data.hex.encode()
        XCTAssertEqual(String(randomString.dropFirst(2)), hexString)
    }
    
    func testDataWithHexEncodingWithPrefix() {
        guard let data = getData(from: randomString) else {
            XCTFail()
            return
        }
        
        let hexString = data.hex.encode(includePrefix: true)
        XCTAssertEqual(randomString, hexString)
    }
    
    private func getData(from string: String) -> Data? {
        string.hex.decode()
    }
}
