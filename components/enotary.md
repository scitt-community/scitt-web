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
For example, Owen is the user uploading the Wabbit Networks device driver, with the associated SBOM.
The device driver and SBOM are signed by Wabbit Networks.
Owen is simply performing the operation.
Wabbit Networks doesn't have access to the SCITT APIs to upload the driver, but Owen does.

When Parker goes to install the Wabbit Networks device driver, they don't really care or know who Owen is, but the software must be signed by a trusted identity, in this case: Wabbit Networks.
The trust is placed on the identity of the artifact, the access control limits are external to the SCITT functionality.

The eNotary policy provides control over the identity provider types, such as x509 issued certificates, or additional DID Web based identities.

Also similar to a public notary, the eNotary process does not attempt to validate the evidence being notarized.

## eNotary Conceptual Overview

The eNotary provides the following conceptual workflow:

1. A claim about the Wabbit Networks device driver, (with optional evidence) is submitted to a SCITT instance
2. On ingress, the SCITT eNotary parses the identity associated with the claim and compares the identity type with those supported in the eNotary policy. 
3. If the eNotary policy supports the identity type, including x509 and DID providers, the eNotary will attempt to verify the validity of the identity.
4. If the identify is verified, the optional evidence is persisted to an associated storage provider. The reference to the persisted evidence is maintained in the SCITT ledger, with the identity of the evidence.
5. A notarized entry is made to the SCITT ledger, endorsed by the eNotaries signing key.
6. A receipt is returned, endorsed by the eNotary, persisted alongside the evidence.

<img src="/assets/enotary.svg" alt="SCITT eNotary" style="width:500px;"/>
