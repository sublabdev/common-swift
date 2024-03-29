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

import BigInt
import Foundation

/// A hex-encoded String to Data converter object
public final class StringHex {
    enum Error: Swift.Error {
        case hexLengthInvalid
        case hexSymbolInvalid
    }
    
    private let string: String
    
    /// Creates a hex-encoded String to Data converter object
    /// - Parameters:
    ///     - string: Hex-encoded String to convert into Data
    public init(string: String) {
        self.string = string
    }
    
    /// Converts hex-encoded String into Data
    /// - Returns: Optional Data converted from hex-encoded String
    public func decode() throws -> Data {
        let hexString = string.dropFirst(string.hasPrefix("0x") ? 2 : 0)
        
        guard hexString.count % 2 == 0 else {
            throw Error.hexLengthInvalid
        }
        
        var newData = Data(capacity: hexString.count/2)
        
        var indexIsEven = true
        for i in hexString.indices {
            if indexIsEven {
                let byteRange = i...hexString.index(after: i)
                guard let byte = UInt8(hexString[byteRange], radix: 16) else {
                    throw Error.hexSymbolInvalid
                }
                newData.append(byte)
            }
            indexIsEven.toggle()
        }
        return newData
    }
    
    public func toBigUInt() -> BigUInt? {
        let hexString = string.dropFirst(string.hasPrefix("0x") ? 2 : 0)
        return BigUInt(hexString, radix: 16)
    }
}

public extension String {
    /// Hex-encoded String to Data converter
    var hex: StringHex {
        .init(string: self)
    }
}
