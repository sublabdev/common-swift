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

/// `Int512` wrapper over `BigInt`
public struct Int512: Codable, Equatable {
    let value: BigInt
    public static let size = 64
    
    /// Creates `Int512` wrapper over `BigInt`
    /// - Parameters:
    ///     - value: Value of type `BigInt`
    public init(value: BigInt) {
        self.value = value
    }
    
    /// Creates `Int512` wrapper over BigInt using `String`. This initializer can fail.
    /// - Parameters:
    ///     - string: A `String` value
    public init?(_ string: String) {
        guard let value = BigInt(string) else { return nil }
        self.value = value
    }
    
    /// Creates `Int512` wrapper over `BigInt` using `Int64`
    /// - Parameters:
    ///     - string: An `Int64` value
    public init(_ integer: Int64) {
        value = BigInt(integerLiteral: integer)
    }
}

extension Int512 {
    /// Converts `Int512` into `Data`
    /// - Returns: `Data` from `Int512`'s value
    public func data() -> Data {
        let data = value.serialize()
        let exportSize = min(data.count, byteSize(byteSizeType: .int512))
        return data.copyOf(size: exportSize).reversed().toData()
    }
}

extension Data {
    /// Generates `Int512` from `Data`
    /// - Returns: `Int512` from `Data`
    public func int512() -> Int512 {
        Int512(value: BigInt(reversed().toData()))
    }
}

extension String {
    /// Generates `Int512` from `String`
    /// - Returns: `Int512` from `String`
    public func int512() -> Int512? {
        Int512(self)
    }
}
