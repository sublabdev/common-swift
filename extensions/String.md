**EXTENSION**

# `String`

## Methods
### `init(_:)`

Initialize a new string with the base-10 representation of an unsigned big integer.

- Complexity: O(v.count^2)

### `init(_:radix:uppercase:)`

Initialize a new string representing an unsigned big integer in the given radix (base).

Numerals greater than 9 are represented as letters from the English alphabet,
starting with `a` if `uppercase` is false or `A` otherwise.

- Requires: radix > 1 && radix <= 36
- Complexity: O(count) when radix is a power of two; otherwise O(count^2).

### `init(_:radix:uppercase:)`

Initialize a new string representing a signed big integer in the given radix (base).

Numerals greater than 9 are represented as letters from the English alphabet,
starting with `a` if `uppercase` is false or `A` otherwise.

- Requires: radix > 1 && radix <= 36
- Complexity: O(count) when radix is a power of two; otherwise O(count^2).
