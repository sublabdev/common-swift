**STRUCT**

# `BigInt`

An arbitary precision signed integer type, also known as a "big integer".

Operations on big integers never overflow, but they might take a long time to execute.
The amount of memory (and address space) available is the only constraint to the magnitude of these numbers.

This particular big integer type uses base-2^64 digits to represent integers.

`BigInt` is essentially a tiny wrapper that extends `BigUInt` with a sign bit and provides signed integer
operations. Both the underlying absolute value and the negative/positive flag are available as read-write 
properties.

Not all algorithms of `BigUInt` are available for `BigInt` values; for example, there is no square root or
primality test for signed integers. When you need to call one of these, just extract the absolute value:

```Swift
BigInt(255).abs.isPrime()   // Returns false
```

## Properties
### `isSigned`

### `magnitude`

The absolute value of this integer.

### `sign`

True iff the value of this integer is negative.

### `isZero`

Return true iff this integer is zero.

- Complexity: O(1)

## Methods
### `init(sign:magnitude:)`

Initializes a new big integer with the provided absolute number and sign flag.

### `signum()`

Returns `-1` if this value is negative and `1` if it’s positive; otherwise, `0`.

- Returns: The sign of this number, expressed as an integer of the same type.
