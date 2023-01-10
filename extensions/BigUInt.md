**EXTENSION**

# `BigUInt`

## Properties
### `isSigned`

### `directMultiplicationLimit`

Multiplication switches to an asymptotically better recursive algorithm when arguments have more words than this limit.

### `description`

Return the decimal representation of this integer.

### `playgroundDescription`

Return the playground quick look representation of this integer.

### `bitWidth`

The minimum number of bits required to represent this integer in binary.

- Returns: floor(log2(2 * self + 1))
- Complexity: O(1)

### `leadingZeroBitCount`

The number of leading zero bits in the binary representation of this integer in base `2^(Word.bitWidth)`.
This is useful when you need to normalize a `BigUInt` such that the top bit of its most significant word is 1.

- Note: 0 is considered to have zero leading zero bits.
- Returns: A value in `0...(Word.bitWidth - 1)`.
- SeeAlso: width
- Complexity: O(1)

### `trailingZeroBitCount`

The number of trailing zero bits in the binary representation of this integer.

- Note: 0 is considered to have zero trailing zero bits.
- Returns: A value in `0...width`.
- Complexity: O(count)

### `words`

## Methods
### `+(_:_:)`

Add `a` and `b` together and return the result.

- Complexity: O(max(a.count, b.count))

### `+=(_:_:)`

Add `a` and `b` together, and store the sum in `a`.

- Complexity: O(max(a.count, b.count))

### `signum()`

Returns `1` if this value is, positive; otherwise, `0`.

- Returns: The sign of this number, expressed as an integer of the same type.

### `~(_:)`

Return the ones' complement of `a`.

- Complexity: O(a.count)

### `|=(_:_:)`

Calculate the bitwise OR of `a` and `b`, and store the result in `a`.

- Complexity: O(max(a.count, b.count))

### `&=(_:_:)`

Calculate the bitwise AND of `a` and `b` and return the result.

- Complexity: O(max(a.count, b.count))

### `^=(_:_:)`

Calculate the bitwise XOR of `a` and `b` and return the result.

- Complexity: O(max(a.count, b.count))

### `init(from:)`

### `encode(to:)`

### `compare(_:_:)`

Compare `a` to `b` and return an `NSComparisonResult` indicating their order.

- Complexity: O(count)

### `==(_:_:)`

Return true iff `a` is equal to `b`.

- Complexity: O(count)

### `<(_:_:)`

Return true iff `a` is less than `b`.

- Complexity: O(count)

### `init(_:)`

Initialize a BigInt from bytes accessed from an UnsafeRawBufferPointer

### `init(_:)`

Initializes an integer from the bits stored inside a piece of `Data`.
The data is assumed to be in network (big-endian) byte order.

### `serialize()`

Return a `Data` value that contains the base-256 representation of this integer, in network (big-endian) byte order.

### `quotientAndRemainder(dividingBy:)`

Divide this integer by `y` and return the resulting quotient and remainder.

- Requires: `y > 0`
- Returns: `(quotient, remainder)` where `quotient = floor(self/y)`, `remainder = self - quotient * y`
- Complexity: O(count^2)

### `/(_:_:)`

Divide `x` by `y` and return the quotient.

- Note: Use `divided(by:)` if you also need the remainder.

### `%(_:_:)`

Divide `x` by `y` and return the remainder.

- Note: Use `divided(by:)` if you also need the remainder.

### `/=(_:_:)`

Divide `x` by `y` and store the quotient in `x`.

- Note: Use `divided(by:)` if you also need the remainder.

### `%=(_:_:)`

Divide `x` by `y` and store the remainder in `x`.

- Note: Use `divided(by:)` if you also need the remainder.

### `power(_:)`

Returns this integer raised to the power `exponent`.

This function calculates the result by [successively squaring the base while halving the exponent][expsqr].

[expsqr]: https://en.wikipedia.org/wiki/Exponentiation_by_squaring

- Note: This function can be unreasonably expensive for large exponents, which is why `exponent` is
        a simple integer value. If you want to calculate big exponents, you'll probably need to use
        the modulo arithmetic variant.
- Returns: 1 if `exponent == 0`, otherwise `self` raised to `exponent`. (This implies that `0.power(0) == 1`.)
- SeeAlso: `BigUInt.power(_:, modulus:)`
- Complexity: O((exponent * self.count)^log2(3)) or somesuch. The result may require a large amount of memory, too.

### `power(_:modulus:)`

Returns the remainder of this integer raised to the power `exponent` in modulo arithmetic under `modulus`.

Uses the [right-to-left binary method][rtlb].

[rtlb]: https://en.wikipedia.org/wiki/Modular_exponentiation#Right-to-left_binary_method

- Complexity: O(exponent.count * modulus.count^log2(3)) or somesuch

### `init(exactly:)`

### `init(_:)`

### `greatestCommonDivisor(with:)`

Returns the greatest common divisor of `self` and `b`.

- Complexity: O(count^2) where count = max(self.count, b.count)

### `inverse(_:)`

Returns the [multiplicative inverse of this integer in modulo `modulus` arithmetic][inverse],
or `nil` if there is no such number.

[inverse]: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm#Modular_integers

- Returns: If `gcd(self, modulus) == 1`, the value returned is an integer `a < modulus` such that `(a * self) % modulus == 1`. If `self` and `modulus` aren't coprime, the return value is `nil`.
- Requires: modulus > 1
- Complexity: O(count^3)

### `hash(into:)`

Append this `BigUInt` to the specified hasher.

### `init(exactly:)`

### `init(_:)`

### `init(truncatingIfNeeded:)`

### `init(clamping:)`

### `init(integerLiteral:)`

Initialize a new big integer from an integer literal.

### `multiply(byWord:)`

Multiply this big integer by a single word, and store the result in place of the original big integer.

- Complexity: O(count)

### `multiplied(byWord:)`

Multiply this big integer by a single Word, and return the result.

- Complexity: O(count)

### `multiplyAndAdd(_:_:shiftedBy:)`

Multiply `x` by `y`, and add the result to this integer, optionally shifted `shift` words to the left.

- Note: This is the fused multiply/shift/add operation; it is more efficient than doing the components
  individually. (The fused operation doesn't need to allocate space for temporary big integers.)
- Returns: `self` is set to `self + (x * y) << (shift * 2^Word.bitWidth)`
- Complexity: O(count)

### `multiplied(by:)`

Multiply this integer by `y` and return the result.

- Note: This uses the naive O(n^2) multiplication algorithm unless both arguments have more than
  `BigUInt.directMultiplicationLimit` words.
- Complexity: O(n^log2(3))

### `*(_:_:)`

Multiply `a` by `b` and return the result.

- Note: This uses the naive O(n^2) multiplication algorithm unless both arguments have more than
  `BigUInt.directMultiplicationLimit` words.
- Complexity: O(n^log2(3))

### `*=(_:_:)`

Multiply `a` by `b` and store the result in `a`.

### `isStrongProbablePrime(_:)`

Returns true iff this integer passes the [strong probable prime test][sppt] for the specified base.

[sppt]: https://en.wikipedia.org/wiki/Probable_prime

### `isPrime(rounds:)`

Returns true if this integer is probably prime. Returns false if this integer is definitely not prime.

This function performs a probabilistic [Miller-Rabin Primality Test][mrpt], consisting of `rounds` iterations, 
each calculating the strong probable prime test for a random base. The number of rounds is 10 by default,
but you may specify your own choice.

To speed things up, the function checks if `self` is divisible by the first few prime numbers before
diving into (slower) Miller-Rabin testing.

Also, when `self` is less than 82 bits wide, `isPrime` does a deterministic test that is guaranteed to 
return a correct result.

[mrpt]: https://en.wikipedia.org/wiki/Miller–Rabin_primality_test

### `randomInteger(withMaximumWidth:using:)`

Create a big unsigned integer consisting of `width` uniformly distributed random bits.

- Parameter width: The maximum number of one bits in the result.
- Parameter generator: The source of randomness.
- Returns: A big unsigned integer less than `1 << width`.

### `randomInteger(withMaximumWidth:)`

Create a big unsigned integer consisting of `width` uniformly distributed random bits.

- Note: I use a `SystemRandomGeneratorGenerator` as the source of randomness.

- Parameter width: The maximum number of one bits in the result.
- Returns: A big unsigned integer less than `1 << width`.

### `randomInteger(withExactWidth:using:)`

Create a big unsigned integer consisting of `width-1` uniformly distributed random bits followed by a one bit.

- Note: If `width` is zero, the result is zero.

- Parameter width: The number of bits required to represent the answer.
- Parameter generator: The source of randomness.
- Returns: A random big unsigned integer whose width is `width`.

### `randomInteger(withExactWidth:)`

Create a big unsigned integer consisting of `width-1` uniformly distributed random bits followed by a one bit.

- Note: If `width` is zero, the result is zero.
- Note: I use a `SystemRandomGeneratorGenerator` as the source of randomness.

- Returns: A random big unsigned integer whose width is `width`.

### `randomInteger(lessThan:using:)`

Create a uniformly distributed random unsigned integer that's less than the specified limit.

- Precondition: `limit > 0`.

- Parameter limit: The upper bound on the result.
- Parameter generator: The source of randomness.
- Returns: A random big unsigned integer that is less than `limit`.

### `randomInteger(lessThan:)`

Create a uniformly distributed random unsigned integer that's less than the specified limit.

- Precondition: `limit > 0`.
- Note: I use a `SystemRandomGeneratorGenerator` as the source of randomness.

- Parameter limit: The upper bound on the result.
- Returns: A random big unsigned integer that is less than `limit`.

### `>>=(_:_:)`

### `<<=(_:_:)`

### `>>(_:_:)`

### `<<(_:_:)`

### `squareRoot()`

Returns the integer square root of a big integer; i.e., the largest integer whose square isn't greater than `value`.

- Returns: floor(sqrt(self))

### `advanced(by:)`

Adds `n` to `self` and returns the result. Traps if the result would be less than zero.

### `distance(to:)`

Returns the (potentially negative) difference between `self` and `other` as a `BigInt`. Never traps.

### `init(_:radix:)`

Initialize a big integer from an ASCII representation in a given radix. Numerals above `9` are represented by
letters from the English alphabet.

- Requires: `radix > 1 && radix < 36`
- Parameter `text`: A string consisting of characters corresponding to numerals in the given radix. (0-9, a-z, A-Z)
- Parameter `radix`: The base of the number system to use, or 10 if unspecified.
- Returns: The integer represented by `text`, or nil if `text` contains a character that does not represent a numeral in `radix`.

### `init(unicodeScalarLiteral:)`

Initialize a new big integer from a Unicode scalar.
The scalar must represent a decimal digit.

### `init(extendedGraphemeClusterLiteral:)`

Initialize a new big integer from an extended grapheme cluster.
The cluster must consist of a decimal digit.

### `init(stringLiteral:)`

Initialize a new big integer from a decimal number represented by a string literal of arbitrary length.
The string must contain only decimal digits.

### `subtractReportingOverflow(_:shiftedBy:)`

Subtract `other` from this integer in place, and return a flag indicating if the operation caused an
arithmetic overflow. `other` is shifted `shift` digits to the left before being subtracted.

- Note: If the result indicates an overflow, then `self` becomes the twos' complement of the absolute difference.
- Complexity: O(count)

### `subtractingReportingOverflow(_:shiftedBy:)`

Subtract `other` from this integer, returning the difference and a flag indicating arithmetic overflow.
`other` is shifted `shift` digits to the left before being subtracted.

- Note: If `overflow` is true, then the result value is the twos' complement of the absolute value of the difference.
- Complexity: O(count)

### `subtractingReportingOverflow(_:)`

Subtracts `other` from `self`, returning the result and a flag indicating arithmetic overflow.

- Note: When the operation overflows, then `partialValue` is the twos' complement of the absolute value of the difference.
- Complexity: O(count)

### `subtract(_:shiftedBy:)`

Subtract `other` from this integer in place.
`other` is shifted `shift` digits to the left before being subtracted.

- Requires: self >= other * 2^shift
- Complexity: O(count)

### `subtracting(_:shiftedBy:)`

Subtract `b` from this integer, and return the difference.
`b` is shifted `shift` digits to the left before being subtracted.

- Requires: self >= b * 2^shift
- Complexity: O(count)

### `decrement(shiftedBy:)`

Decrement this integer by one.

- Requires: !isZero
- Complexity: O(count)

### `-(_:_:)`

Subtract `b` from `a` and return the result.

- Requires: a >= b
- Complexity: O(a.count)

### `-=(_:_:)`

Subtract `b` from `a` and store the result in `a`.

- Requires: a >= b
- Complexity: O(a.count)

### `init(words:)`
