import XCTest
import CommonSwift

class StringHexTests: XCTestCase {
    let randomString = "0x6d6574610e4d0c000c1c73"
    
    func testDataWithHexEncodingWithoutPrefix() throws {
        let data = try randomString.hex.decode()
        let hexString = data.hex.encode()
        XCTAssertEqual(String(randomString.dropFirst(2)), hexString)
    }
    
    func testDataWithHexEncodingWithPrefix() throws {
        let data = try randomString.hex.decode()
        let hexString = data.hex.encode(includePrefix: true)
        XCTAssertEqual(randomString, hexString)
    }
}
