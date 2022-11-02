---
layout: page
title:  "eNotary"
parent: Components
nav_order: 5
---

# eNotary

SCITT provides a means to store information on a ledger. The information on the ledger is only as good as the validity of the identities for the content placed on the ledger.
Similar to a public notary, an eNotary verifies the identity of the incoming requests.
If the identity is verified, the eNotary will provide a notarized endorsement for the entry, issuing a [receipt](https://datatracker.ietf.org/doc/draft-birkholz-scitt-receipts/){:target="_blank"} for the completed process.

The identify of the claims and/or evidence, is not tied to the identity of the user interacting with the SCITT APIs.

## Scenario

Roles in this scenario:
- **Owen** is the software lead at ACME Rockets, who's responsible for importing public content into ACME Rockets private registries for use within the ACME Rockets environment.
- **Parker** is an IT admin, who's responsible for updating machine configurations.

Owen imports the Wabbit Networks device driver, with the associated SBOM from the Wabbit Networks public registry to the ACME Rockets private registry.
The device driver and SBOM are signed by Wabbit Networks, giving them an identity that can be referenced independently from the location of the content.
Owen is simply performing the operation to import the driver and SBOM, but isn't representing ownership of the driver and SBOM.

> _for more info, see [Separating Identity From Location](https://stevelasker.blog/2021/09/24/separating-identity-from-location/)_

When Parker goes to install the Wabbit Networks device driver, the installation checks the identity of the driver, and may even check the contents of the SBOM. The sysetm must be signed by a trusted identity, in this case: Wabbit Networks.
The trust is placed on the identity of the artifact, the access control limits are external to the SCITT functionality.

The eNotary policy provides control over the identity provider types, such as x509 issued certificates, or additional identifiers.

Also similar to a public notary, the eNotary process does not attempt to validate the evidence being notarized.

## eNotary Conceptual Overview

There are two submissions to the SCITT ledger:

1. The claim for the identity of the Wabbit Networks device driver
2. The SBOM (evidence) for the the Wabbit Networks device driver

### Submitting a Claim

The Wabbit Networks device driver is imported to ACME Rockets outside of the SCITT workflow. A unique ID is associated with the driver, which is referenced when placing content on the ledger.

<img src="/assets/enotary-claim.svg" alt="SCITT eNotary Claim" style="width:500px;"/>

1. A claim, indicating ownership of the Wabbit Networks device driver, is submitted to the SCITT instance. The claim contains a unique ID ([purl?](https://github.com/ietf-scitt/scitt-web/issues/28)) to the device driver.
2. On ingress, the SCITT eNotary parses the identity associated with the claim and compares the identity type with those supported in the eNotary policy. The eNotary policy also supports allow/deny lists for specific identities.
3. If the eNotary policy supports the identity type, including x509 and [DID](https://www.w3.org/TR/did-core/) providers, the eNotary will attempt to verify the validity of the identity.
4. If the identify is verified, the claim is persisted to an associated storage provider.
5. A notarized entry is made to the SCITT ledger.
6. A receipt is generated, using the specific SCITT instances eNotary signing key. In this case, the ACME Rockets eNotary key.
7. The receipt is placed in the associated storage provider, alongside the claim.

### Submitting Evidence (SBOM)

<img src="/assets/enotary-evidence.svg" alt="SCITT eNotary Evidence" style="width:500px;"/>

1. *Evidence*, the SBOM of the Wabbit Networks device driver, is submitted to the SCITT instance. The SBOM contains a unique ID ([purl?](https://github.com/ietf-scitt/scitt-web/issues/28)) to the device driver.
2. On ingress, the SCITT eNotary parses the identity associated with the *evidence* and compares the identity type with those supported in the eNotary policy. The eNotary policy also supports allow/deny lists for specific identities.
3. If the eNotary policy supports the identity type, including x509 and DID providers, the eNotary will attempt to verify the validity of the identity.
4. If the identify is verified, the *evidence* is persisted to an associated storage provider.
5. A notarized entry is made to the SCITT ledger.
6. A receipt is generated, using the specific SCITT instances eNotary signing key. In this case, the ACME Rockets eNotary key.
7. The receipt is placed in the associated storage provider, alongside the *evidence*.
