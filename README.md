# iOS Insight

**A USB-first iPhone diagnostics and storage intelligence workspace for Windows.**

iOS Insight helps iPhone owners understand device health, reported app storage, available diagnostics, recurring crash reports, configuration profiles, and safe next steps — from one guided desktop interface.

> **Honest by design:** iOS Insight works within Apple's normal, non-jailbroken device-access model. It does not claim to scan protected iOS files, read every app's private data, remove arbitrary caches, or prove an iPhone is malware-free.

![Platform](https://img.shields.io/badge/platform-Windows-2563eb) ![Python](https://img.shields.io/badge/Python-3.10%2B-3776ab) ![Connection](https://img.shields.io/badge/connection-USB-16a34a) ![License](https://img.shields.io/badge/license-MIT-64748b)

## Features

- Guided USB pairing with Apple's normal Trust/pairing flow.
- Device overview: model, iOS version, capacity and exposed diagnostics.
- Installed app inventory and reported app/container sizes where available.
- Storage review for large apps and accessible media, with explicit coverage labels.
- Battery telemetry and diagnostic indicators when supported by the device.
- Crash-report parsing and recurring-pattern review.
- Accessible configuration-profile inventory.
- Cleanup recommendations with explanations; no silent or automatic deletion.
- Local JSON/HTML diagnostic reports.
- Optional local-backup forensics with Amnesty International's Mobile Verification Toolkit (MVT).

## Windows quick start

1. Install Python 3.10+ from https://www.python.org/downloads/.
2. Install Apple device support using Apple Devices or a supported iTunes installation.
3. Extract the full source archive supplied with this project.
4. Connect the iPhone using a USB data cable, unlock it, and approve Trust This Computer.
5. Run the Windows launcher included in the extracted project.
6. Select Refresh USB, choose the device, and start the read-only scan.

No wireless debugging or jailbreak is required.

## Import the supplied source ZIP into this repository

The repository includes [PUBLISH_SOURCE_TO_GITHUB.bat](PUBLISH_SOURCE_TO_GITHUB.bat) for Windows. Download that script, place it beside the supplied `ios-insight-full-usb(1).zip` file, and double-click it (or drag the ZIP onto the BAT file). It uses your own Git for Windows sign-in to clone this repository, extract the source archive, create a commit, and push it to `main`.

You can instead run the script with the archive path as its first argument. Review the files before pushing; the script excludes Git metadata, virtual environments, and Python cache files.

## Safety and iOS limitations

- Scan is read-only and must not delete or alter user content.
- Cleanup suggestions require user review and explicit action.
- Back up important data before removing apps, documents, photos, or attachments.
- iOS sandboxing prevents unrestricted access to protected app data, system caches, and live internals.
- A desktop utility cannot provide a complete live antivirus scan on a normal, non-jailbroken iPhone.
- MVT can compare accessible backup artefacts with known indicators of compromise, but a match requires investigation and no match does not prove a device is clean.

| Area | Expected access |
|---|---|
| Device identity and OS version | Usually available |
| Diagnostics and battery telemetry | Depends on device services and iOS version |
| Installed apps | Supported inventory; fields vary |
| Per-app sizes | May be available; calculation may be slow |
| Photos and media | Supported media access only; not a full filesystem view |
| Messages and app-private databases | Not generally available through ordinary pairing |
| System Data and protected caches | No arbitrary read/delete access |
| Full live malware scan | Not available under normal iOS permissions |

See the documentation in docs/ for scan coverage, architecture, cleanup guidance, privacy and optional forensic analysis.

## Development

The source archive includes the application, tests, Windows launcher, dependency metadata, architecture documentation, contribution guidelines, security policy and MIT license.

Run the test suite with pytest after installing the development dependencies. See docs/DEVELOPMENT.md for setup.

## Contributing

Bug reports and feature requests are welcome. Read CONTRIBUTING.md and CODE_OF_CONDUCT.md. Never publish device identifiers, UDIDs, serial numbers, backup passwords, or private diagnostic reports in public issues.

## Security

Read SECURITY.md for responsible vulnerability disclosure.

## License

MIT. See LICENSE.

---

**Project status:** early development. Automated tests cover core analysis and parsing logic. Physical-device compatibility and GUI behaviour must be verified on supported Windows/iOS combinations before relying on a result.
