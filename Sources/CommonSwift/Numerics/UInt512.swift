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

import Foundation
import BigInt

/// `UInt512` wrapper over `BigInt`
public struct UInt512: Codable, Equatable {
    let value: BigUInt
    public static let size = 64
    
    /// Creates `UInt512` wrapper over `BigInt`
    /// - Parameters:
    ///     - value: Value of type `BigInt`
    public init(value: BigUInt) {
        self.value = value
    }
    
    /// Creates `UInt512` wrapper over BigInt using `String`. This initializer can fail.
    /// - Parameters:
    ///     - string: A `String` value
    public init?(_ string: String) {
        guard let value = BigUInt(string) else { return nil }
        self.value = value
    }
    
    /// Creates `UInt512` wrapper over BigInt using `UInt64`
    /// - Parameters:
    ///     - string: An `UInt64` value
    public init(_ integer: UInt64) {
        value = BigUInt(integerLiteral: integer)
    }
}

extension UInt512 {
    /// Converts `UInt512` into `Data`
    /// - Returns: `Data` from `UInt512`'s value
    public func data() -> Data {
        let data = value.serialize()
        let exportSize = min(data.count, byteSize(byteSizeType: .uInt512))
        return data.copyOf(size: exportSize).reversed().toData()
    }
}

extension Data {
    /// Generates `UInt512` from `Data`
    /// - Returns: `UInt512` from `Data`
    public func uInt512() -> UInt512 {
        UInt512(value: BigUInt(reversed().toData()))
    }
}

extension String {
    /// Generates `UInt512` from `String`
    /// - Returns: `UInt512` from `String`
    public func uInt512() -> UInt512? {
        UInt512(self)
    }
}
