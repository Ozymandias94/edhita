Edhita
======

Fully open source text editor for iOS written in SwiftUI.  
https://edhita.bornneet.com/

![](https://edhita.bornneet.com/assets/screenshot.png)

## What does Edhita mean?

`Edhita (Japanese Romaji)` == `エディタ (Japanese Katakana)` == `Editor (English)`

## Looking for the Android version?

If you're curious about the Android counterpart, developed using Kotlin, check out [DotText](https://github.com/tnantoka/DotText).

## Development

```
$ cp Constants.swift Edhita/Models/
$ open Edhita.xcodeproj
```

The Swift Package Manager is used for dependencies.

## SwiftUI

Edhita is currently built with SwiftUI.  
Previous versions were built with Swift (UIKIt) or Objective-C.

Year | Version | Technology | Branch
--- | --- | --- | ---
2022 | 3.x.x | SwiftUI | [master](https://github.com/tnantoka/edhita/tree/master)
2014 | 2.x.x | Swift (UIKit) | [uikit](https://github.com/tnantoka/edhita/tree/uikit)
2010 | 1.x.x | Objective-C | [Objective-C](https://github.com/tnantoka/edhita/tree/Objective-C)

## Mojicon

[Icon images](/Edhita/Assets.xcassets/AppIcon.appiconset) are created by [Mojicon](https://mojicon.net/).

## Acknowledgments

- https://fonts.google.com/noto/specimen/Noto+Emoji
- https://github.com/JohnSundell/Ink
- https://github.com/siteline/SwiftUI-Introspect
- https://github.com/quanghits/GoogleMobileAds

## License

[The MIT license](/LICENSE)

## Author

[@tnantoka](https://twitter.com/tnantoka)


## Customer.io (Data In)

The app can send identify / track / screen events to a Customer.io CDP source (EU region).
The write key is read from a local, gitignored file, so nothing is sent without it:

```sh
echo 'CIO_CDP_WRITE_KEY = <your CDP source write key>' > CustomerIO.local.xcconfig
```

Then build and run in Xcode. Debug builds identify as `edhita-demo-user`; creating a file sends a `File Created` event.
