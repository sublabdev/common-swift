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

/// `Int128` wrapper over `BigInt`
public struct Int128: Codable, Equatable {
    let value: BigInt
    public static let size = 16
    
    /// Creates `Int128` wrapper over `BigInt`
    /// - Parameters:
    ///     - value: Value of type `BigInt`
    public init(value: BigInt) {
        self.value = value
    }
    
    /// Creates `Int128` wrapper over BigInt using `String`. This initializer can fail.
    /// - Parameters:
    ///     - string: A `String` value
    public init?(_ string: String) {
        guard let value = BigInt(string) else { return nil }
        self.value = value
    }
    
    /// Creates `Int128` wrapper over BigInt using `Int64`
    /// - Parameters:
    ///     - string: An `Int64` value
    public init(_ integer: Int64) {
        value = BigInt(integerLiteral: integer)
    }
}

extension Int128 {
    /// Converts `Int128` into `Data`
    /// - Returns: `Data` from `Int128`'s value
    public func data() -> Data {
        let data = value.serialize()
        let exportSize = min(data.count, byteSize(byteSizeType: .int128))
        return data.copyOf(size: exportSize).reversed().toData()
    }
}

extension Data {
    /// Generates `Int128` from `Data`
    /// - Returns: `Int128` from `Data`
    public func int128() -> Int128 {
        Int128(value: BigInt(reversed().toData()))
    }
}

extension String {
    /// Generates `Int128` from `String`
    /// - Returns: `Int128` from `String`
    public func int128() -> Int128? {
        Int128(self)
    }
}
