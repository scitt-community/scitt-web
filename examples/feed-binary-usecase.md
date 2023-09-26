# Binary Use Case

## Software Producer

[Wabbit Networks](fictitious-companies.md#wabbit-networks) frequently releases their **net-monitor** software.
Their software is distributed as container images and loose binaries for Linux and Windows servers.
They maintain multiple versions of their software, while releasing patched versions.

Wabbit Networks provides SBOMs, VEX Reports with a Vendor Response File (VRF) for each of their releases.
They occasionally need to issue new versions of the VRF, as well as updated VEX reports, because even while the software may remain unmodified th vulnerability landscape and Rabbit Networks' understanding of it is constantly evolving.

### The Net Monitor Release Page

Due to the complexity of different versions, platforms, architectures and product lines, companies and projects typically use marketing based navigation to assist users with their download choices.
The below matrix is meant to visually represent a common matrix, that would be provided through marketing links.

Versions and Patched Releases:

- For each major release (`1.0.0`, `2.0.0`, `3.0.0`), there are a set of minor feature releases (`1.1.0`, `1.2.0`) with potential patches (`1.0.1`, `1.0.2`).  
  <Note:> Vendors and projects use various forms of versioning, including [SemVer](https://semver.org/), [CalVer](https://calver.org/) and other forms.
  SCITT must support any versioning scheme a producer wishes to support.
- In the below examples, not all platforms have patches for a specific major or minor release.

| Version | Linux Container | Linux Binary | Windows Container | Windows Installer |
| - | - | - | - | - |
| v1.0.0 | [net-monitor:v1.0.0-linux-amd64]() | [net-monitor-v1_0_0.gzip]() | [net-monitor:v1.0.0-win-amd64]() | [net-monitor-v1_0_0.msi]() |
| -- v1.0.1 | [net-monitor:v1.0.1-linux-amd64]() | [net-monitor-v1_0_1.gzip]() | [net-monitor:v1.0.1-win-amd64]() | [net-monitor-v1_0_1.msi]() |
| -- v1.0.2 | [net-monitor:v1.0.2-linux-amd64]() | [net-monitor-v1_0_2.gzip]() |  |  |
| - v1.1.0 | [net-monitor:v1.1.0-linux-amd64]() | [net-monitor-v1_1_0.gzip]() | [net-monitor:v1.1.0-win-amd64]() | [net-monitor-v1_1_0.msi]() |
| -- v1.1.1 |  |  | [net-monitor:v1.1.1-win-amd64]() | [net-monitor-v1_1_1.msi]() |
| -- v1.1.2 |  |  | [net-monitor:v1.1.2-win-amd64]() | [net-monitor-v1_1_2.msi]() |
| - v1.2.0 | [net-monitor:v1.2.0-linux-amd64]() | [net-monitor-v1_2_0.gzip]() | [net-monitor:v1.2.0-win-amd64]() | [net-monitor-v1_2_0.msi]() |
| v2.0.0 | [net-monitor:v2.0.0-linux-amd64]() | [net-monitor-v2_0_0.gzip]() | [net-monitor:v2.0.0-win-amd64]() | [net-monitor-v2_0_0.msi]() |
| - v2.1.0 | [net-monitor:v2.1.0-linux-amd64]() | [net-monitor-v2_1_0.gzip]() | [net-monitor:v2.1.0-win-amd64]() | [net-monitor-v2_1_0.msi]() |
| - v2.1.1 | [net-monitor:v2.1.1-linux-amd64]() | [net-monitor-v2_1_1.gzip]() | | |
| - v2.1.2 | [net-monitor:v2.1.2-linux-amd64]() | [net-monitor-v2_1_2.gzip]() | | |
| - v3-alpha | [net-monitor:v3-alpha-linux-amd64]() | [net-monitor-v3-alpha.gzip]() | [net-monitor:v3-alpha-win-amd64]() | [net-monitor-v3-alpha.msi]() |

### Questions for Producers

When software producers wish to publish additional information for their products, how can they:

- Let consumers know the most recently patched version for a specific platform/architecture release?
- Let consumers know a new version is available?
- Let consumers know an SBOM, VEX, VRF was verifiably published by the publisher?
- Let consumers know a newer version of the SBOM, VEX, VRF was released, _and_ verifiably published by the publisher?

> _[IETF SCITT Use Cases](https://www.ietf.org/archive/id/draft-ietf-scitt-software-use-cases-01.html#name-identify-statements-and-upd)_

## Software Consumer

[ACME Rockets](./fictitious-companies.md#acme-rockets) consumes the Net Monitor software from Wabbit Networks.
They are currently using their version 1 release, and need to get notified of updates when they're available.

## Third Party Security Vendor

[Cosmic Security](./fictitious-companies.md#cosmic-security) evaluates the security posture of its customers, providing 3rd party analysis and validation.

ACME Rockets subscribes to Cosmic Security to monitor the software they use within their environment.

## End to End Integration

ACME Rockets deploys the Cosmic Security products to monitor the software in their environment.
Wabbit Networks publishes their security information through a public SCITT Service.
For each product ACME Rockets consumes, a SCITT Feed Identifier is used to get the latest information about the products.

Cosmic Security also publishes their perspective of the ACME Rockets software, as well as other vendors and projects.
Cosmic Security publishes the information using a a SCITT Service that provides a series of statements associated with the Feeds of each of their products they consume.

## References

Examples of Product Download Pages
- [OpenSCAD](http://openscad.org/downloads.html)
  - [Images are currently available for platforms linux/amd64 and linux/arm64](https://hub.docker.com/r/openscad/openscad)
- [Unity](https://unity.com/releases/editor/whats-new/2023.1.10)
  - A collection of releases for Windows (`.exe`), Mac (`.pkg`), Linux (.`tar.xz`)
