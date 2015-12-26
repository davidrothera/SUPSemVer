//
//  SUPSemVer.swift
//  SUPSemVer
//
//  Created by David Rothera on 26/12/2015.
//  Copyright © 2015 Supratude Ltd. All rights reserved.
//

import Foundation

class SemVer : CustomStringConvertible, Comparable {
    var major : Int
    var minor : Int
    var patch : Int

    var prerelease : String?

    var description : String {
        if prerelease == nil {
            return "SemVer(Major: \(major), Minor: \(minor), Patch: \(patch))"
        }
        return "SemVer(Major: \(major), Minor: \(minor), Patch: \(patch), Prerelease: \(prerelease!))"
    }

    init?(_ semVer: String) {
        let versionComponents = semVer.componentsSeparatedByString("-")
        let versions = versionComponents[0].componentsSeparatedByString(".")

        prerelease = versionComponents.count > 1 ? versionComponents[1] : nil

        if versions.count < 3 {
            // TODO: Get rid of these after Swift2.2
            major = 0
            minor = 0
            patch = 0
            return nil
        }

        guard let major = Int(versions[0]), minor = Int(versions[1]), patch = Int(versions[2]) else {
            self.major = 0
            self.minor = 0
            self.patch = 0
            return nil
        }

        self.major = major
        self.minor = minor
        self.patch = patch
    }

    init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    init(major: Int, minor: Int, patch: Int, prerelease: String) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.prerelease = prerelease
    }
}

func ==(lhs: SemVer, rhs: SemVer) -> Bool {
    if lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch && lhs.prerelease == rhs.prerelease {
        return true
    }
    return false
}

func <(lhs: SemVer, rhs: SemVer) -> Bool {
    if lhs.major < rhs.major {
        return true
    } else if lhs.major <= rhs.major && lhs.minor < rhs.minor {
        return true
    } else if lhs.major <= rhs.major && lhs.minor <= rhs.minor && lhs.patch < rhs.patch {
        return true
    }
    return false
}