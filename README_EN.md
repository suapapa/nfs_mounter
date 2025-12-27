# NFS Mounter

A Flutter-based desktop application that helps you easily mount and manage NFS (Network File System) directories on macOS.

## Key Features

- **GUI-based Mount Management**: Mount and unmount NFS servers with an intuitive interface without using the command line.
- **Persist Mount Points**: Configured mount points (server address, path, etc.) are saved even after the app is closed, making them convenient to use when you restart.
- **Multi-language Support**: Includes support for Korean (KO) and multiple languages.
- **Productivity**: Quickly connect and manage frequently used NFS paths.

## Getting Started

This project is developed as a macOS application. You need to have the Flutter SDK installed to run it.

1. Clone the repository.
2. Install dependencies.
   ```bash
   flutter pub get
   ```
3. Run the app with the macOS target.
   ```bash
   flutter run -d macos
   ```

## Requirements

- macOS
- Access permissions to an NFS server

## License

This project is distributed under the [MIT License](LICENSE).
