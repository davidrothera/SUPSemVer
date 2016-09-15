![Platform iOS 8+](https://img.shields.io/badge/Platform-iOS%208%2B-blue.svg)
![Platform Mac OS X 10.9+](https://img.shields.io/badge/Platform-Mac%20OS%20X%2010.9%2B-blue.svg)
![Platform](https://img.shields.io/badge/Platform-tvOS%209%2B-blue.svg)
![Platform](https://img.shields.io/badge/Platform-watchOS%202%2B-blue.svg)
<br/>
[![Language Swift 3](https://img.shields.io/badge/Language-Swift%203-orange.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/davidrothera/SUPSemVer.svg?branch=master)](https://travis-ci.org/davidrothera/SUPSemVer)
[![codecov.io](https://codecov.io/github/davidrothera/SUPSemVer/coverage.svg?branch=master)](https://codecov.io/github/davidrothera/SUPSemVer?branch=master)
[![Version](https://img.shields.io/cocoapods/v/SUPSemVer.svg?style=flat)](http://cocoapods.org/pods/SUPSemVer)
[![License](https://img.shields.io/cocoapods/l/SUPSemVer.svg?style=flat)](http://cocoapods.org/pods/SUPSemVer)
[![Platform](https://img.shields.io/cocoapods/p/SUPSemVer.svg?style=flat)](http://cocoapods.org/pods/SUPSemVer)


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
