/**
 *
 * Copyright 2023 SUBSTRATE LABORATORY LLC <info@sublab.dev>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0

 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */

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
        
        let encoded = data.hex.encode()
        XCTAssertEqual(encoded, expectedHex)
    }
}
