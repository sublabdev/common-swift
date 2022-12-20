### Swift+Hex Example

## Usage

Bellow is shown how can be used `hex` extension on `String`. From that extension methods for
decoding an encoding can be accessed.

```Swift
let randomString = "0x6d6574610e4d0c000c1c73"

guard let data = randomString.hex.decode() else { return }
let hexString = data.hex.encode()
```
Here we have a hex `String`. To decode it `decode()` method should be called on the extension.
To encode `Data` back to `String` `encode()` method should be called on the extension.
The `encode()` method has a parameter `includePrefix`. Its value is set to `false`, by default.

Also, it's possible to encode data with keeping the prefix. For that, call `encode()` method with `includePrefix` parameter set to `true`.

```
let hexString = data.hex.encode(includePrefix: true)
```

`hexString` above equals to `0x6d6574610e4d0c000c1c73`