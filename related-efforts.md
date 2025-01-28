---
layout: page
title:  Related Efforts
permalink: /related-efforts
nav_order: 1
has_children: true
has_toc: false
---

# Related Efforts

Software and services that implement the SCITT architecture support a variety of use cases. Below is an inventory of related efforts, be it specifications, implementations, or initiatives, where SCITT is applicable.

## Software Supply Chain Security
A list of efforts for protecting the security of software supply chain

- [Microsoft SDL](https://www.microsoft.com/en-us/securityengineering/sdl)
- [Google Software Delivery Shield](https://github.blog/2023-04-19-introducing-npm-package-provenance/)
- [SigStore](https://www.sigstore.dev/)
A [blog post](https://openssf.org/case-studies/2024/02/16/scaling-up-supply-chain-security-implementing-sigstore-for-seamless-container-image-signing/)
describing how SigStore is used by Yahoo!


## Artifacts
A list of artifact types that can be (potentially) recorded in a Transparency registry

### Bill of Materials

- [CycloneDX](https://cyclonedx.org)
- [SPDX](https://spdx.dev/)
- [Software Identificatino Tags - SWID (ISO/IEC 19770-2:2015)](https://www.iso.org/standard/65666.html)
- [CoSWID - Concise Software Identification Tags (RFC9393)](https://datatracker.ietf.org/doc/rfc9393/)
- [Microsoft's SBOM tool](https://github.com/microsoft/sbom-tool)

### Vulnerability Disclosure and Management

- [Common Security Advisory Framework (CSAF)](https://csaf.io)
- [VEX CSAF Profile](https://docs.oasis-open.org/csaf/csaf/v2.0/os/csaf-v2.0-os.html#45-profile-5-vex)
- [OpenVEX](https://github.com/openvex)

### Other types
- [Supply-chain Levels for Software Artifacts (SLSA)](https://slsa.dev/)
SLSA together with SigStore is [used by npm](https://github.blog/2023-04-19-introducing-npm-package-provenance/)
- [Security scorecards](https://securityscorecards.dev/)
- [in-toto attestations](https://in-toto.io/)

## Related tools

### Digital Signatures and Key Transparency

- [OpenPubkey](https://www.bastionzero.com/openpubkey)
A tool that can be used for generating public keys using OIDC
- [Sigstore Fulcio](https://docs.sigstore.dev/certificate_authority/overview/)
A Certificate Authority that can be used for generating certificates bound to identities in other systems (e.g., GitHub)
- [step-ca](https://github.com/smallstep/certificates)
A self-hosted CA that can be used (among other things) for issuing certificates using OIDC
- [The update framework](https://theupdateframework.io/)
A tool for managing public keys that can be used for verifying signatures
- [CONIKS](https://coniks-sys.github.io/)
A Key Transparency service [used in Apple's iMessage](https://security.apple.com/blog/imessage-contact-key-verification/)

### Centralized registries

- [Grafeas](https://grafeas.io/)
- [Linux Vendor Firmware Service](https://fwupd.org/)

### Auditable registries
- [Certificate Transparency](https://certificate.transparency.dev/)
  - A [blog post](https://wiki.mozilla.org/Security/Binary_Transparency) about how Mozilla is using
  certificate transparency to implement "binary transparency"
- [Binary Transparency](https://binary.transparency.dev/)
  - Binary transparency as [used in Google's Pixel phones](https://developers.google.com/android/binary_transparency/pixel)
  - Binary transparency as [used in F-Secure's Armory Drive](https://github.com/usbarmory/armory-drive/wiki/Firmware-Transparency)
  - Binary transparency as [used by Go](https://go.googlesource.com/proposal/+/master/design/25530-sumdb.md)

## Directives and guidelines
Various bodies have issued directives that are related to software supply chain security

- [NIST Secure Software Development Framework (SSDF)](https://csrc.nist.gov/pubs/sp/800/218/final)
- [White House executive order M-22-18](https://www.whitehouse.gov/wp-content/uploads/2022/09/M-22-18.pdf)