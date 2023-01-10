**STRUCT**

# `BigUInt`

An arbitary precision unsigned integer type, also known as a "big integer".

Operations on big integers never overflow, but they may take a long time to execute.
The amount of memory (and address space) available is the only constraint to the magnitude of these numbers.

This particular big integer type uses base-2^64 digits to represent integers; you can think of it as a wrapper
around `Array<UInt64>`. (In fact, `BigUInt` only uses an array if there are more than two digits.)

## Methods
### `init()`

Initializes a new BigUInt with value 0.

### `init(words:)`

Initializes a new BigUInt with the specified digits. The digits are ordered from least to most significant.
