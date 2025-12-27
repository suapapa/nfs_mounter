# AGENTS.md - NFS Mounter

This document provides key guidelines and context for AI agents and developers to effectively understand, maintain, and contribute to the **NFS Mounter** project.

---

## 1. Project Overview

- **Project Name**: NFS Mounter
- **Purpose**: Provide a graphical user interface (GUI) for mounting and unmounting NFS (Network File System) directories on macOS.
- **Target Platform**: macOS

## 2. Tech Stack

- **Language**: [Dart](https://dart.dev/)
- **Framework**: [Flutter for Desktop (macOS)](https://flutter.dev/desktop)
- **State Management**: *To Be Determined (TBD)*
- **Key Dependencies**:
  - `flutter_localizations` (Required for multi-language support)
  - *TBD*

## 3. Architecture & Design

- **Architecture Pattern**: Provider
- **Directory Structure**:
  - `lib/`: Main source code
    - `l10n/`: Localization files (`.arb`)
    - `models/`: Data models
    - `views/`: UI components and screens
    - `controllers/`: Logic and state management
  - `test/`: Unit and widget tests

## 4. Coding Conventions

- **Style Guide**: Follow the official [Dart Style Guide](https://dart.dev/guides/language/evolutionary-style-guide).
- **Documentation**: Provide clear comments for complex logic and public APIs.
- **Asynchronous Programming**: Use `Future`, `Stream`, and `async`/`await` appropriately to ensure the UI remains responsive and never blocks.
- **Error Handling**: Implement robust error handling, especially for shell command executions (mount/unmount).

## 5. Agent Instructions

### 5.0 Scaffold the project
- Scaffold the project using the Flutter for Desktop (macOS) template.
- Ensure that the project is configured for macOS development.
- Refer `/docs/nfs_mounter_plan.jpeg` for the project plan drawing. 


### 5.1 Code Modifications
- Adhere to the established architecture patterns.
- Verify compatibility when introducing new packages or dependencies.
- **Validation**: Always run `flutter analyze` after modifications. Ensure there are no linting errors or warnings before committing.

### 5.2 UI & Localization
- **Multi-language Support**: All UI strings MUST support English (`en`), Korean (`ko`), and Polish (`pl`).
- **L10n Workflow**: 
  1. Add/Update keys in `lib/l10n/`.
  2. Run `flutter gen-l10n`.
  3. Verify that the app compiles without errors.

### 5.3 Testing
- When changing logic, update existing tests or create new unit/widget tests in the `test/` directory.
- Ensure all tests pass by running `flutter test`.

### 5.4 Documentation
- Keep this `AGENTS.md` and the `README.md` updated when adding new features, changing APIs, or modifying the project structure.

---

> **Note**: This file is a living document and should be updated continuously as the project evolves.
