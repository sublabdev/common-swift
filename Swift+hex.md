### String+Hex Example

```Swift
import CommonSwift

let randomString = "0x6d6574610e4d0c000c1c73"

guard let data = randomString.hex.decode() else { return }
let hexString = data.hex.encode()
```
`hexString` above equals to `6d6574610e4d0c000c1c73`, which means that decoding and encoding back of a hex `String` works correctly. The `encode()` method has a parameter `includePrefix` whose value is `false` by default.

Also, it's possible to encode data with keeping the prefix. For that, call `encode()` method with `includePrefix` parameter set to `true`.

```
let hexString = data.hex.encode(includePrefix: true)
```

`hexString` above equals to `0x6d6574610e4d0c000c1c73`