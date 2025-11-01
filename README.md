# Learning Swift Testing (and comparison with XCTest)

This repository is for learning the new Swift Testing framework (using @Test, #expect, #require) in an Xcode project. It also includes a basic skeleton for UI tests using XCTest.

[![CI](https://github.com/your-org-or-user/your-repo/actions/workflows/ci.yml/badge.svg)](https://github.com/your-org-or-user/your-repo/actions/workflows/ci.yml)

Course link: [Swift Testing Essentials: A Practical Guide](https://www.udemy.com/course/swift-testing-essentials-a-practical-guide/)

## Requirements
- Xcode 16 or later
- Swift 5.10+ (for Swift Testing)
- iOS/macOS depending on your project target

## Getting Started
1. Open the project in Xcode.
2. Run all tests:
   - Product → Test (⌘U), or
   - From the command line:
     - iOS example:
       xcodebuild test -scheme OuluBankR1 -destination 'platform=iOS Simulator,name=iPhone 15'
     - macOS example:
       xcodebuild test -scheme OuluBankR1 -destination 'platform=macOS'

## Project Structure (Tests)
- OuluBankR1Tests (Swift Testing)
- OuluBankR1UITests (XCTest)

## GitHub Actions (CI)
This repository includes a GitHub Actions workflow to build and run tests on every push and pull request.
The workflow file lives at .github/workflows/ci.yml and runs tests on a macOS runner with Xcode 16, using an iPhone 15 simulator.

## Goals
- Learn Swift Testing syntax: @Test, #expect, #require, #require(Optional).
- Organize tests by feature/module.
- Understand when to use Swift Testing vs. XCTest (UI tests remain in XCTest).
