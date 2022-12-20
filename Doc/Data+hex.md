### Data+Hex Example

## Usage

Bellow is shown how can be used `hex` extension on `Data`. From the extension a method for
encoding the `Data` to hex-string can be accessed.

```Swift
let testString = "Some String"
let expectedHex = "536f6d6520537472696e67"

guard let data = testString.data(using: .utf8) else { return }
let hexString = data.hex.encode()
```
In the above example we have some test `String` and it's expected hex result (without a prefix, in this case).
Then we convert it to `Data` object. After that, we call `encode()` method on it.
The `encode()` method has a parameter `includePrefix`. Its value is set to `false`, by default.

Also, it's possible to encode data with keeping the prefix. For that, call `encode()`
method with `includePrefix` parameter set to `true`.

```
let hexString = data.hex.encode(includePrefix: true)
```

`hexString` above equals to `0x536f6d6520537472696e67`