import XCTest
import CommonSwift

class DataHexTests: XCTestCase {
    func testHexStringFromData() {
        let testString = "Some String"
        let expectedHex = "536f6d6520537472696e67"
        
        guard let data = testString.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let result = data.hexadecimal
        XCTAssertEqual(result, expectedHex)
    }
}
