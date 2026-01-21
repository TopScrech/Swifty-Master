# Repository Guidelines

## Project Structure & Module Organization
- Platform code lives in top-level folders: `iOS/`, `macOS/`, `tvOS/`, `visionOS/`.
- Shared SwiftUI topics and demos are under `iOS/Topics/`, with models in `iOS/Models/` and navigation in `iOS/Nav/`.
- Code snippets shown in the app live in `iOS/Code Block/Code Blocks/` as `.txt` files, referenced by `iOS/Code Block/CodeBlock.swift`.
- Assets live in `Assets.xcassets` and `Shared Assets.xcassets` per platform.
- Tests (if added) should go in `Unit Tests/` and be wired to the relevant Xcode test target.

## Build, Test, and Development Commands
Prefer Xcode for running and signing. CLI examples:
- List schemes: `xcodebuild -project "Swifty Master.xcodeproj" -list`
- Build iOS: `xcodebuild -project "Swifty Master.xcodeproj" -scheme iOS -destination 'platform=iOS Simulator,name=iPhone 15' build`
- Build macOS: `xcodebuild -project "Swifty Master.xcodeproj" -scheme macOS build`
- Run tests (once a test target exists): `xcodebuild -project "Swifty Master.xcodeproj" -scheme iOS test -destination 'platform=iOS Simulator,name=iPhone 15'`

## Coding Style & Naming Conventions
- Swift/SwiftUI, 4-space indentation, Xcode default formatting.
- Types use `PascalCase` (e.g., `TopicConfirmationDialog`), members use `camelCase`.
- Keep SwiftUI view files named after the main view type.
- When adding a new “Topic,” update: `iOS/Models/Topic.swift`, `TopicCategory.swift`, `TopicIcon.swift`, `TopicDoc.swift`, `TopicRelated.swift`, the view in `iOS/Topics/`, and its code sample in `iOS/Code Block/Code Blocks/`.

## Testing Guidelines
- No tests are currently present; prefer XCTest if you add coverage.
- Name test files `SomethingTests.swift` and place them in `Unit Tests/`.

## Commit & Pull Request Guidelines
- Recent commits use short, sentence-case messages (e.g., “upgrade”, “migrated to folders”). Follow this style unless a more formal convention is agreed.
- PRs should include a clear description, affected platforms, and screenshots or recordings for UI changes. Link issues when relevant.

## Configuration Notes
- The project is an Xcode project: open `Swifty Master.xcodeproj` to manage schemes, signing, and assets.
