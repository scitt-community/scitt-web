---
layout: page
title:  "Distributing Supply Chain Artifacts, Today and Tomorrow"
author: Steve Lasker
permalink: /distributing-today-tomorrow
---

## What is a Supply Chain

Are supply chains unique to software? Consider this definition from [Adam Hayes – Investopedia](https://www.investopedia.com/terms/s/supplychain.asp)

> _“A supply chain is a network of individuals and companies who are involved in creating a product and delivering it to the consumer. Links on the chain begin with the producers of the raw materials and end when the van delivers the finished product to the end user.”_

How does the definition relate to a software supply chain?

A supply chain spans multiple entities, requiring the promotion of artifacts across environments. In the physical world, this uses vehicles to transport (promote) between locations. In the digital world, a network is used to transport (promote) across public and private package managers.

### Supply Chain Integrity and Trust

When you consume an artifact from a new location, how does the user know it originated from a trusted producer? Do you only purchase Tylenol directly from Johnson & Johnson? Do you only acquire software directly from a vendor, or do you promote to a secured internal location within your control, just as you bring Tylenol and other goods into your home for when you need it?
As artifacts move across the supply chain, the integrity of the artifact must be maintained. 

> [How the Tylenol incident of 1982 changed the way we consume medication](https://www.pbs.org/newshour/health/tylenol-murders-1982)
>
> <img align="left" height="100" style="padding-right:10px" src="https://d3i6fh83elv35t.cloudfront.net/static/2014/09/95797955-1-207x300.jpg">
>
> Lessons from the physical supply chain can and should be implemented in the digital supply chain. Prior to 1982, medication was shipped without any concept of a safety seal. Another place we look for integrity; opening your favorite beverage. If you don’t feel the vacuum seal release, you immediately question the integrity of the product. 
>
> The Tylenol incident didn’t just change the medical supply chain, it changed the entire supply chain.

### The Software Supply Chain

<img src="./assets/supply-chain-e2e.svg" alt="Consuming Public Content" style="width:800px;"/>

1.	**Sealed and Signed Build Artifacts**: The output of the build includes a series of signed and sealed artifacts, including an SBOM and any known vulnerabilities at the time of the build.  
2.	**Verification Claims and Evidence**: While verifying the build, various testing claims may be applied, from functional test results to build composition security scans. The evidence must also have a sealed verifiable identity to assure consumers can trust the evidence.
3.	**Publisher-Distribution**: As the software is ready for distribution, a subset of information is published, as not all the build or internal details are intended to be public. Details of the build may be used for subsequent forensics if/when issues may arise.
4. **Consumer-Internal Distribution**: Consumers promote a copy of the software they take a dependency upon into their "golden registry".   
5. **Verification**: Consumers should verify the content they consume meets their specific requirements, which may be verticals or their unique business requirements.
6. **Consumption**: Deployments are made, impacting end users, based on internally verified copies of all dependencies and builds. New deployments (including scaling instances) are based on the internally verified copies.
7. **Archival**: As artifacts are moved out of production, copies are maintained for compliance. Security analysis is applied to previously deployed artifacts, enabling forensics to potential previous events.
8. **Publishers have internal golden registries** for the content they depend upon, creating the supply chain dependency loop.

## Distributing Supply Chain Artifacts with Existing Standards

As we think of SCITT providing a ledger, attesting to transparency and trust, these are new, developing capabilities that will take time to evolve, and be deployed across all cloud providers, for each software vendor, or company that builds software to run in their environment.

There are existing capabilities that can be used today, that are production supported services, based on standards that run on all cloud providers and are available as on-premise products and projects.

Using the supply chain above, we can see the use of:

- [OCI Distribution based registries][oci-distribution-spec] for securely storing and distributing all types of artifacts.
- [COSE based signatures][cose-spec]: for sealing artifacts with verifiable identities.

<img src="./assets/supply-chain-e2e-oci.svg" alt="Consuming Public Content" style="width:800px;"/>
  
1. **Creation**: The output of a build environment publishes the container images, or other packages, to an [OCI Distribution][oci-distribution-spec] based registry. This includes an SBOM and internal build evidence that would be maintained. All published artifacts are signed with a [COSE][cose-spec] based signature, using `notation sign` assuring there's a verifiable identity associated with each artifact.
2. **Verification**: Subsequent verification processes may write claims to the registry, with a verifiable COSE based signature.
3. **Distribution**: The publisher (Wabbit Networks) may choose to publish a _subset_ of the related artifacts as the internal claims are maintained for forensics should any issues arise.  
4. **Consumer Distribution**: The consumer (ACME Rockets) subscribes to the `net-monitor:v1` published artifact, and copies all the related artifacts using [`oras copy`][oras-copy].  
  _See [Artifact Updates](#artifact-updates) for subsequent updates, such as newly discovered vulnerabilities, redirects and revocation._
5. **Consumer Verification**: As part of the ACME Rockets verification steps additional scans may be applied to consumed artifacts and updates. Additional claims are added, attesting to the allowed usage within the ACME Rockets environment. The additional claims are signed by ACME Rockets, which may supersede any claims made by the publisher (Wabbit Networks).
6. **Consumption**: As a consumer deploys their software, they'll want to verify the artifacts are intended for the particular environment. Using `notation verify <artifact>`, a consumer can assure it's from a trusted identity, approved for consumption in the target environment.  
_**TODO:** add claims verification using `oras discover/pull`_
7. **Archival**: As ACME Rockets upgrades `net-monitor:v1` to a newer version, or simply phases out the usage of the `net-monitor:v1` software, a copy is made to the archival registry. Additional claims are added for when the artifact was in production, providing information to security scans that may identify potential exploits that must be investigated. The artifacts in the archive registry are maintained for whatever policy is required. As that policy expires, the artifacts and evidence may be purged.

### Regional Reliability and Private Networks 

ACME Rockets, like most companies, want their private software environments to remain private, even though they may be running on public clouds. By leveraging cloud provider OCI Distribution based registries, consumers benefit from private network support, as well as regional availability and global replication for locality and reliability.

## Adding SCITT Capabilities to Existing Services

In the above example existing registries are utilized to track claims with verifiable signatures. While OCI Distribution based registries provide basic `push|discover|pull` of artifacts and related claims & evidence, OCI Distribution based registries lack policy based submission (eNotary verification) and richer query capabilities.

<img src="./assets/what-is-scitt.svg" alt="What Is SCITT" align="right" style="width:400px;"/>

In the SCITT workflow, the submission of claims, made by verifiable identities, are made to the SCITT service. The identity of the claims are verified to meet the policies of the SCITT instance. Any associated claims and evidence are persisted in the SCITT storage provider. In this case, the OCI Distribution based registry from above is used. By extending the existing services, the users workflows are _enhanced_, not dramatically changed.

<img src="./assets/supply-chain-e2e-oci-scitt.svg" alt="Consuming Public Content" style="width:800px;"/>

Receipts for the claims are placed in the registry, enabling offline verification of the claims. However, the SCITT service provides richer querying to find specific claims made by specific identities.

<img src="./assets/wabbit-network-claims-signature.svg" alt="Detached COSE Signature" align="left" style="width:50px;padding-right:10px"/>
<img src="./assets/wabbit-network-claims-receipt.svg" alt="Detached COSE Receipt" align="right" style="width:50px;padding-left:10px"/>

One of the specific enhancements is the shift from claim with a detached COSE based **signature**, to a claim with a detached COSE based **receipt**.
<br><br>
1. The SBOM, which is a type of evidence, is submitted to the SCITT APIs. The SCITT ledger will index the mediaType of the evidence, the identity of the detached signature for the evidence, and the unique identifier of the `net-monitor:v1` image. This establishes a relationship that can be queried, returning the claims and evidence related to the unique identifier of the `net-monitor:v1` image.  
A COSE enveloped receipt, which encapsulates the ledger information, and the evidence (SBOM) are then persisted in the registry. The COSE based SCITT receipt replaces the COSE based signature in the previous OCI only workflow.  
_See [SCITT API Sequence/Workflow](scitt-storage-api-sequence) for more details_
2. Build claims are also also submitted to the SCITT APIs. Similar to step 1, the claims and SCITT receipt are indexed by the ledger, and persisted in the associated OCI storage.
3. Verification claims are submitted to the SCITT apis, which demonstrates a series of claims and evidence that may be persisted along the build & validate workflows.
4. As Wabbit Networks publishes their software, selected claims and evidence are available on the same endpoints as before. Not all internal information is made public. Some claims and evidence may be limited to a subset. (NOTE: add [RBAC doc](https://github.com/ietf-scitt/use-cases/blob/main/scitt-components/scitt-rbac.md){:target="_blank"})
5. As ACME Rockets opts-into SCITT based APIs, they have richer query capabilities to find the claims and evidence they desire. For consumers that have not yet opted into SCITT, the SBOMs and claims remain in the same place, allowing Wabbit Networks consumers to migrate on their timelines.
6. The verification steps can utilize the claims in the registry, or start taking advantage of richer queries on the SCITT APIs, which are available on the registry endpoints that exist in the private network.
7. _But wait, there's more_. As the artifact retention policies expire, the user may purge the large artifacts from storage, while the SCITT ledger maintains the lightweight history of claims, enabling an audit history of important operations.

### SCITT Private Network Support

The SCITT APIs are exposed through the underlying storage providers APIs. In the above case, these are the OCI Distribution based APIs. The highlights the ability for SCITT to add capabilities to existing registries, enabling promotion of artifacts and claims, into private networks the registry is already configured to operate.

## Artifact Updates

> TODO: 
> describe updated streams, including redirection, EOL and revocation scenarios.

[cose-spec]:               https://datatracker.ietf.org/doc/html/rfc8152
[oras-copy]:               https://oras.land/blog/oras-0.14-and-future/#copy-an-image-from-registry-a-to-registry-b
[oci-distribution-spec]:   https://github.com/opencontainers/distribution-spec
