# Satispay App Extension

## Requirements

- iOS ≥ 8.0
- [Satispay](https://itunes.apple.com/it/app/satispay/id790287076?mt=8) ≥ 2.0.22

## Installation

- [With CocoaPods](#installation-using-cocoapods)
- [Copying source files](#installation-copying-source-files)

## Installation (using CocoaPods)

The *Satispay App Extension* support framework is available through [CocoaPods](http://cocoapods.org).

To install
it, simply add the following lines to your Podfile:

```ruby
source "https://github.com/satispay/pods"
pod "SatispayAppExtension"
```

To use the extension in a Swift project, also add the following line to your Podfile:

```ruby
use_frameworks!
```

and then import `SatispayAppExtension` in your Swift/Obj-C files:

```swift
import SatispayAppExtension
```

```objectivec
@import SatispayAppExtension;
```

## Installation (copying source files)

The support framework can also be used if the integrating project doesn't use CocoaPods.
To do so, just drag the source files found in the `SatispayAppExtension/Classes/` directory into the target project.

## Usage

Detailed usage instructions are available as comments into the `SatispayAppExtension/Classes/SatispayExtension.h` header file and implemented in the `Example` project.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## More info

Additional info on how to create and handle charges are available in the Online API documentation at:
https://s3-eu-west-1.amazonaws.com/docs.online.satispay.com/index.html

## License

    Copyright 2016 Satispay SpA.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    All trademarks and registered trademarks are the property of their respective owners.
