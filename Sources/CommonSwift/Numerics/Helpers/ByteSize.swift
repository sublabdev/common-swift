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

/// Byte size types
enum ByteSizeType {
    case int128
    case uInt128
    case int256
    case uInt256
    case int512
    case uInt512
}

/// The byte size based on the provided type
/// - Parameters:
///     - byteSizeType: The type of byte size
///     - Returns: The size for a given type.
func byteSize(byteSizeType: ByteSizeType) -> Int {
    switch byteSizeType {
    case .int128, .uInt128:
        return 128 / 8
    case .int256, .uInt256:
        return 256 / 8
    case .int512, .uInt512:
        return 512 / 8
    }
}
