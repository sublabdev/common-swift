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
