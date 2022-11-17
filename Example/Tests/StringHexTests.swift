import XCTest
import CommonSwift

class StringHexTests: XCTestCase {
    func testDataWithHexEncoding() {
        let randomString = "0x6d6574610e4d0c000c1c73"
        guard let data = randomString.data(using: .hexadecimal) else {
            XCTFail()
            return
        }
        
        let hexString = data.hexadecimal
        XCTAssertEqual(String(randomString.dropFirst(2)), hexString)
    }
}
