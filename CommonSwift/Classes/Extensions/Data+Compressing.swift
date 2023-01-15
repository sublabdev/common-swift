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

extension Data {
    
    /// The `Data` with zeroes removed at the end if needed
    public var removingZeroesAtEnd: Data {
        guard let offset = lastIndex(where: { $0 > 0 }) else {
            return Data([0])
        }
    
        return self[0...offset]
    }
    
    /// Fills zeroes at the end if needed
    /// - Parameters:
    ///     - byteWidth: Describes the width of byte which is used to calculate the number of zeroes to add
    /// - Returns: `Data` with zeroes filled in
    public func fillingZeroesAtEnd(byteWidth: Int) -> Data {
        guard count != byteWidth else { return self }
        
        var data = self
        for _ in 0..<(byteWidth - count) {
            data.append(0)
        }
        
        return data
    }
}
