### Data+Hex Example

```Swift
import CommonSwift

let testString = "Some String"
guard let data = testString.data(using: .utf8) else { return }
let encoded = data.hex.encode()
```
`encoded` above equals to `536f6d6520537472696e67`