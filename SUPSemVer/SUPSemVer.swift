//
//  SUPSemVer.swift
//  SUPSemVer
//
//  Created by David Rothera on 26/12/2015.
//  Copyright © 2015 Supratude Ltd. All rights reserved.
//

import Foundation

extension Collection {
    // A safe way to return an index if it exists and a nil if not
    public subscript(safe index: Index) -> _Element? {
        return index >= startIndex && index < endIndex ? self[index] : nil
    }
}

open class SemVer: CustomStringConvertible, Comparable {
    var major: Int
    var minor: Int
    var patch: Int

    var prerelease: String?

    open var description: String {
        if prerelease == nil {
            return "SemVer(Major: \(major), Minor: \(minor), Patch: \(patch))"
        }
        return "SemVer(Major: \(major), Minor: \(minor), Patch: \(patch), " +
            "Prerelease: \(prerelease!))"
    }

    public init?(_ semVer: String) {
        let versionComponents = semVer.components(separatedBy: "-")
        let versions = versionComponents[0].components(separatedBy: ".")

        prerelease = versionComponents.count > 1 ? versionComponents[1] : nil

        // The first element of the array always exists, try and convert to an Int
        if let majorComponent = Int(versions[0]) {
            self.major = majorComponent
        } else {
            self.major = 0
        }

        // The second element might not exist, use the safe extension
        if let minorComponent = versions[safe: 1] {
            self.minor = Int(minorComponent) ?? 0
        } else {
            self.minor = 0
        }

        // The third element might not exist, use the safe extension
        if let patchComponent = versions[safe: 2] {
            self.patch = Int(patchComponent) ?? 0
        } else {
            self.patch = 0
        }
    }

    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    public init(major: Int, minor: Int, patch: Int, prerelease: String) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.prerelease = prerelease
    }
}

public func == (lhs: SemVer, rhs: SemVer) -> Bool {
    if lhs.major == rhs.major &&
       lhs.minor == rhs.minor &&
       lhs.patch == rhs.patch &&
       lhs.prerelease == rhs.prerelease {
        return true
    }
    return false
}

public func < (lhs: SemVer, rhs: SemVer) -> Bool {
    if lhs.major < rhs.major {
        return true
    } else if lhs.major <= rhs.major && lhs.minor < rhs.minor {
        return true
    } else if lhs.major <= rhs.major && lhs.minor <= rhs.minor && lhs.patch < rhs.patch {
        return true
    }
    return false
}
