---
layout: post
title:  "Distributing Supply Chain Artifacts, Today and Tomorrow"
author: Steve Lasker
permalink: /distributing-with-oci
---

## What is a Supply Chain

Are supply chains unique to software? Consider this definition from [Adam Hayes – Investopedia](https://www.investopedia.com/terms/s/supplychain.asp)

> _“A supply chain is a network of individuals and companies who are involved in creating a product and delivering it to the consumer. Links on the chain begin with the producers of the raw materials and end when the van delivers the finished product to the end user.”_

How does the definition relate to a software supply chain?

A supply chain spans multiple entities, requiring the promotion of artifacts across environments. In the physical world, this uses vehicles to transport (promote) between locations. In the digital world, a network is used to transport (promote) to different registries.

### Supply Chain Integrity and Trust

When you consume an artifact from a new location, how does the user know it originated from a trusted producer? Do you only purchase aspirin directly from Tylenol? Do you only acquire software directly from a vendor, or do you promote to a secured internal location within your control, just as you place the bottle of aspirin in medicine cabinet?
As artifacts move across the supply chain, the integrity of the artifact must be maintained. 

> [How the Tylenol murders of 1982 changed the way we consume medication](https://www.pbs.org/newshour/health/tylenol-murders-1982)
>
> <img align="left" height="100" style="padding-right:10px" src="https://d3i6fh83elv35t.cloudfront.net/static/2014/09/95797955-1-207x300.jpg">
>
> Lessons from the physical supply chain can and should be implemented in the digital supply chain. Prior to 1982, medication was shipped without any concept of a safety seal. Today, as you twist open your favorite beverage, if you don’t feel the vacuum seal release, you immediately question the integrity of the product. 
>
> The Tylenol murders of 1982 didn’t just change the medical supply chain, they changed the entire supply chain.

### The Software Supply Chain

<img src="./assets/supply-chain-e2e.svg" alt="Consuming Public Content" style="width:800px;"/>

**Publisher**:

1.	**Sealed and Signed Build Artifacts**: The output of the build includes a series of signed and sealed artifacts, including an SBOM and any known vulnerabilities at the time of the build.  
   (a). **Publishers have internal golden registries** for the content they depend upon, creating the supply chain dependency loop.
2.	**Verification Claims and Evidence**: While verifying the build, various testing claims may be applied, from functional test results to build composition security scans. The evidence must also have a sealed verifiable identity to assure consumers can trust the evidence.
3.	**Distribution**: As the software is ready for distribution, a subset of information is published, as not all the build or internal details are intended to be public. Details of the build may be used for subsequent forensics if/when issues may arise.

**Consumers**:

1. **Internal Distribution**: Consumers promote a copy of the software they take a dependency upon into their "golden registry".   
2. **Verification**: Consumers should verify the content they consume meets their specific requirements, which may be verticals or their unique business requirements.
3. **Consumption**: Deployments are made, impacting end users, based on internally verified copies of all dependencies and builds. New deployments (including scaling instances) are based on the internally verified copies.
4. **Archival**: As artifacts are moved out of production, copies are maintained for compliance. Security analysis is applied to previously deployed artifacts, enabling forensics to potential previous events.

## Distributing Supply Chain Artifacts with Existing Standards

As we think of SCITT providing a ledger, attesting to transparency and trust, these are new, developing capabilities that will take time to evolve, and be deployed across all cloud providers, for each software vendor, or company that builds software to run in their environment.

There are existing capabilities that can be used today, that are production supported services, based on standards that run on all cloud providers and are available as on-premise products and projects.

Using the supply chain above, we can see the use of:

- [OCI Distribution based registries][oci-distribution-spec] for securely storing and distributing all types of artifacts.
- [COSE based signatures][cose-spec]: for sealing artifacts with verifiable identities.

<img src="./assets/supply-chain-e2e-oci.svg" alt="Consuming Public Content" style="width:800px;"/>

**Publisher**:

1. The output of a build environment publishes their container images, or other packages, to an [OCI Distribution][oci-distribution-spec] based registry. This includes an SBOM and internal build claims that would be maintained. All published artifacts are signed with a [cose][cose-spec] based signature to assure there's a verifiable identity associated with each artifact.
2. Subsequent steps, including verification processes may write additional claims to the registry, with a verifiable cose based signature.
3. The publisher (ACME Rockets) may choose to publish a subset of the information as the internal claims are maintained for forensics if any issues arise.

**Consumer**:

4. ACME Rockets subscribes to the `net-monitor:v1` published artifact, and copies all the related artifacts using [`oras copy`][oras-copy]
5. As part of the ACME Rockets verification steps, additional claims are added, attesting to the allowed usage within the ACME Rockets environment. The additional claims are signed by ACME Rockets, which may supersede any claims made by the publisher (Wabbit Networks)
6. As ACME Rockets upgrades `net-monitor:v1` to a newer version, or simply phases out the usage of the `net-monitor:v1` software, a copy is made to the archival registry. Additional claims are added for when the artifact was in production, providing information to security scans that may identify potential exploits that must be investigated. The artifacts in the archive registry are maintained for whatever policy is required.

### Regional Reliability and Private Networks 

ACME Rockets, like most companies, want their private software environments to remain private, even though they may be running on public clouds. By leveraging cloud provider OCI Distribution based registries, consumers may benefit from private network support, as well as regional availability and global replication.

## Adding SCITT Capabilities to Existing Services

In the above example existing registries are utilized to track claims with verifiable signatures. While OCI Distribution based registries provide basic push/discover/pull of artifacts and related artifacts, it lacks policy based submission and richer query capabilities.

In the example below, the submission of claims, made by verifiable identities, are made to the SCITT service which has been associated the OCI Distribution based registry. Receipts for the claims are placed in the registry, enabling offline verification of the claims. However, the SCITT service provides richer querying to find specific claims made by specific identities.

<img src="./assets/supply-chain-e2e-oci-scitt.svg" alt="Consuming Public Content" style="width:800px;"/>

The benefits above highlight the ability to add SCITT capabilities to existing registries, enabling promotion of artifacts and claims, into private networks the registry is already configured to operate.

> TODO: 
> - eNotary to verify the identities
> - Promote "revocation" scenario

[cose-spec]:               https://datatracker.ietf.org/doc/html/rfc8152
[oras-copy]:               https://oras.land/blog/oras-0.14-and-future/#copy-an-image-from-registry-a-to-registry-b
[oci-distribution-spec]:   https://github.com/opencontainers/distribution-spec
