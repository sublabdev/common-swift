**EXTENSION**

# `BigInt`

## Properties
### `description`

Return the decimal representation of this integer.

### `playgroundDescription`

Return the playground quick look representation of this integer.

### `bitWidth`

### `trailingZeroBitCount`

### `words`

## Methods
### `+(_:_:)`

Add `a` to `b` and return the result.

### `+=(_:_:)`

Add `b` to `a` in place.

### `~(_:)`

### `&(_:_:)`

### `|(_:_:)`

### `^(_:_:)`

### `&=(_:_:)`

### `|=(_:_:)`

### `^=(_:_:)`

### `init(from:)`

### `encode(to:)`

### `==(_:_:)`

Return true iff `a` is equal to `b`.

### `<(_:_:)`

Return true iff `a` is less than `b`.

### `init(_:)`

Initialize a BigInt from bytes accessed from an UnsafeRawBufferPointer,
where the first byte indicates sign (0 for positive, 1 for negative)

### `init(_:)`

Initializes an integer from the bits stored inside a piece of `Data`.
The data is assumed to be in network (big-endian) byte order with a first
byte to represent the sign (0 for positive, 1 for negative)

### `serialize()`

Return a `Data` value that contains the base-256 representation of this integer, in network (big-endian) byte order and a prepended byte to indicate the sign (0 for positive, 1 for negative)

### `quotientAndRemainder(dividingBy:)`

Divide this integer by `y` and return the resulting quotient and remainder.

- Requires: `y > 0`
- Returns: `(quotient, remainder)` where `quotient = floor(self/y)`, `remainder = self - quotient * y`
- Complexity: O(count^2)

### `/(_:_:)`

Divide `a` by `b` and return the quotient. Traps if `b` is zero.

### `%(_:_:)`

Divide `a` by `b` and return the remainder. The result has the same sign as `a`.

### `modulus(_:)`

Return the result of `a` mod `b`. The result is always a nonnegative integer that is less than the absolute value of `b`.

### `/=(_:_:)`

Divide `a` by `b` storing the quotient in `a`.

### `%=(_:_:)`

Divide `a` by `b` storing the remainder in `a`.

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

Returns the greatest common divisor of `a` and `b`.

- Complexity: O(count^2) where count = max(a.count, b.count)

### `inverse(_:)`

Returns the [multiplicative inverse of this integer in modulo `modulus` arithmetic][inverse],
or `nil` if there is no such number.

[inverse]: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm#Modular_integers

- Returns: If `gcd(self, modulus) == 1`, the value returned is an integer `a < modulus` such that `(a * self) % modulus == 1`. If `self` and `modulus` aren't coprime, the return value is `nil`.
- Requires: modulus.magnitude > 1
- Complexity: O(count^3)

### `hash(into:)`

Append this `BigInt` to the specified hasher.

### `init()`

### `init(_:)`

Initializes a new signed big integer with the same value as the specified unsigned big integer.

### `init(_:)`

### `init(exactly:)`

### `init(clamping:)`

### `init(truncatingIfNeeded:)`

### `init(integerLiteral:)`

Initialize a new big integer from an integer literal.

### `*(_:_:)`

Multiply `a` with `b` and return the result.

### `*=(_:_:)`

Multiply `a` with `b` in place.

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

### `&<<(_:_:)`

### `&<<=(_:_:)`

### `&>>(_:_:)`

### `&>>=(_:_:)`

### `<<(_:_:)`

### `<<=(_:_:)`

### `>>(_:_:)`

### `>>=(_:_:)`

### `squareRoot()`

Returns the integer square root of a big integer; i.e., the largest integer whose square isn't greater than `value`.

- Requires: self >= 0
- Returns: floor(sqrt(self))

### `advanced(by:)`

Returns `self + n`.

### `distance(to:)`

Returns `other - self`.

### `init(_:radix:)`

Initialize a big integer from an ASCII representation in a given radix. Numerals above `9` are represented by
letters from the English alphabet.

- Requires: `radix > 1 && radix < 36`
- Parameter `text`: A string optionally starting with "-" or "+" followed by characters corresponding to numerals in the given radix. (0-9, a-z, A-Z)
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

### `negate()`

### `-(_:_:)`

Subtract `b` from `a` and return the result.

### `-=(_:_:)`

Subtract `b` from `a` in place.

### `init(words:)`
