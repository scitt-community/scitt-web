---
layout: page
title:  "Distributing with OCI Registries"
parent: Supply Chains
nav_order: 1
---

# Distributing with OCI Registries

As we think of SCITT providing a ledger, attesting to transparency and trust, these are new, developing capabilities that will take time to evolve, and be deployed across all cloud providers, for each software vendor, or company that builds software to run in their environment.

There are existing capabilities that can be used today, that are production supported services, based on standards that run on all cloud providers and are available as on-premise products and projects.

Using the supply chain above, we can see the use of:

- [OCI Distribution based registries][oci-distribution-spec]{:target="_blank"} for securely storing and distributing all types of artifacts.
- [COSE based signatures][cose-spec]{:target="_blank"}: for sealing artifacts with verifiable identities.

<img src="/assets/supply-chain-e2e-oci.svg" alt="Consuming Public Content" style="width:800px;"/>
  
1. **Creation**: The output of a build environment publishes the container images, or other packages, to an [OCI Distribution][oci-distribution-spec]{:target="_blank"} based registry. This includes an SBOM and internal build evidence that would be maintained. All published artifacts are signed with a [COSE][cose-spec]{:target="_blank"} based signature, using `notation sign` assuring there's a verifiable identity associated with each artifact.
2. **Verification**: Subsequent verification processes may write claims to the registry, with a verifiable COSE based signature.
3. **Distribution**: The publisher (Wabbit Networks) may choose to publish a _subset_ of the related artifacts as the internal claims are maintained for forensics should any issues arise.  
4. **Consumer Distribution**: The consumer (ACME Rockets) subscribes to the `net-monitor:v1` published artifact, and copies all the related artifacts using [`oras copy`][oras-copy]{:target="_blank"}.  
  _See [Artifact Updates](#artifact-updates) for subsequent updates, such as newly discovered vulnerabilities, redirects and revocation._
5. **Consumer Verification**: As part of the ACME Rockets verification steps additional scans may be applied to consumed artifacts and updates. Additional claims are added, attesting to the allowed usage within the ACME Rockets environment. The additional claims are signed by ACME Rockets, which may supersede any claims made by the publisher (Wabbit Networks).
6. **Consumption**: As a consumer deploys their software, they'll want to verify the artifacts are intended for the particular environment. Using `notation verify <artifact>`, a consumer can assure it's from a trusted identity, approved for consumption in the target environment.  
_**TODO:** add claims verification using `oras discover/pull`_
7. **Archival**: As ACME Rockets upgrades `net-monitor:v1` to a newer version, or simply phases out the usage of the `net-monitor:v1` software, a copy is made to the archival registry. Additional claims are added for when the artifact was in production, providing information to security scans that may identify potential exploits that must be investigated. The artifacts in the archive registry are maintained for whatever policy is required. As that policy expires, the artifacts and evidence may be purged.

### Regional Reliability and Private Networks 

ACME Rockets, like most companies, want their private software environments to remain private, even though they may be running on public clouds. By leveraging cloud provider OCI Distribution based registries, consumers benefit from private network support, as well as regional availability and global replication for locality and reliability.

**Up Next**:
- See [Distributing with OCI Registries, with SCITT Enhancements](distributing-with-oci-scitt)

[cose-spec]:               https://datatracker.ietf.org/doc/html/rfc8152
[oras-copy]:               https://oras.land/blog/oras-0.14-and-future/#copy-an-image-from-registry-a-to-registry-b
[oci-distribution-spec]:   https://github.com/opencontainers/distribution-spec