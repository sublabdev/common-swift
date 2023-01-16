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

/// `UInt128` wrapper over `BigInt`
public struct UInt128: Codable, Equatable {
    public let value: BigUInt
    public static let size = 16
    
    /// Creates `UInt128` wrapper over BigInt
    /// - Parameters:
    ///     - value: Value of type BigInt
    public init(value: BigUInt) {
        self.value = value
    }
    
    /// Creates `UInt128` wrapper over BigInt using `String`. This initializer can fail.
    /// - Parameters:
    ///     - string: A `String` value
    public init?(_ string: String) {
        guard let value = BigUInt(string) else { return nil }
        self.value = value
    }
    
    /// Creates UInt128 wrapper over BigInt using `UInt64`
    /// - Parameters:
    ///     - string: An `UInt64` value
    public init(_ integer: UInt64) {
        value = BigUInt(integerLiteral: integer)
    }
}

extension UInt128 {
    /// Converts `UInt128` into `Data`
    /// - Returns: `Data` from `UInt128`'s value
    public func data() -> Data {
        let data = value.serialize()
        let exportSize = min(data.count, byteSize(byteSizeType: .uInt128))
        return data.copyOf(size: exportSize).reversed().toData()
    }
}

extension Data {
    /// Generates `UInt128` from `Data`
    /// - Returns: `UInt128` from `Data`
    public func uInt128() -> UInt128 {
        UInt128(value: BigUInt(reversed().toData()))
    }
}

extension String {
    /// Generates `UInt128` from `String`
    /// - Returns: `UInt128` from `String`
    public func uInt128() -> UInt128? {
        UInt128(self)
    }
}
