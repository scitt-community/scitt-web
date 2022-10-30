---
layout: page
title:  "OCI Registries, with SCITT Enhancements"
parent: Supply Chains
nav_order: 2
---

# Distributing with OCI Registries, with SCITT Enhancements

In the [Distributing with OCI Registries]({% link deployments/distributing-with-oci-registries.md %} ) example existing registries are utilized to track claims with verifiable signatures. While OCI Distribution based registries provide basic `push|discover|pull` of artifacts and related claims & evidence, OCI Distribution based registries lack policy based submission (eNotary verification) and richer query capabilities.

<img src="/assets/what-is-scitt.svg" alt="What Is SCITT" align="right" style="width:400px;"/>

In the SCITT workflow, the submission of claims, made by verifiable identities, are made to the SCITT service. The identity of the claims are verified to meet the policies of the SCITT instance. Any associated claims and evidence are persisted in the SCITT storage provider. In this case, the OCI Distribution based registry from above is used. By extending the existing services, the users workflows are _enhanced_, but not dramatically changed.

<img src="/assets/supply-chain-e2e-oci-scitt.svg" alt="Consuming Public Content" style="width:800px;"/>

Receipts for the claims are placed in the registry, enabling offline verification of the claims. However, the SCITT service provides richer querying to find specific claims made by specific identities.

<img src="/assets/wabbit-network-claims-signature.svg" alt="Detached COSE Signature" align="left" style="width:50px;padding-right:10px"/>
<img src="/assets/wabbit-network-claims-receipt.svg" alt="Detached COSE Receipt" align="right" style="width:50px;padding-left:10px"/>

One of the specific enhancements is the shift from claim with a detached COSE based **signature**, to a claim with a detached [COSE based **receipt**][ietf-scitt-receipts].
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
