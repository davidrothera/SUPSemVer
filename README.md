# SUPSemVer

Easy to use framework for comparing semantic versions.

As per the spec for [Semantic Versioning](http://semver.org) versions should be formatted as:

```
MAJOR.MINOR.PATCH (e.g. 1.0.1)
-or-
MAJOR.MINOR.PATCH-PRERELEASE (e.g. 1.0.1-rc1)
```

When you have these versions it is hard to compare them to see whether one version is newer than another etc.

## Usage

There are a couple of ways that you can use SUPSemVer:

```swift
import SUPSemVer

let test1 = SemVer("1.0.1")
let test2 = SemVer("1.0.2-rc1")
let test3 = SemVer(major: 1, minor: 0, patch: 3)
let test4 = SemVer(major: 1, minor: 0, patch: 4, prerelease: "rc1")
let test5 = SemVer(major: 1, minor: 0, patch: 1)
```

The class implements the `Equatable` protocol meaning that you can compare one `SemVer` object to another

```swift
test3 > test1   # false
test1 == test5  # true
```

## Installation

### CocoaPods

```
pod 'SUPSemVer'
```

### Carthage

```
github "davidrothera/SUPSemVer"
```
