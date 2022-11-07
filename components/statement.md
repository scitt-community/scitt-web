---
layout: page
title:  "Statement"
parent: Components
nav_order: 2
---

# Statement

From [IETF: SCITT Architecture Terminology](https://www.ietf.org/archive/id/draft-birkholz-scitt-architecture-02.html#name-terminology-2)  
**Statement**: Any serializable information about an Artifact. To help interpretation of Statements, they must be tagged with a media type (as specified in [RFC6838]). For example, a statement may represent a Software Bill Of Materials (SBOM) that lists the ingredients of a software Artifact, or some endorsement or attestation about an Artifact.

As users place signed statements upon the registry, there are two major categories of information:

1. **Header**: Information which is common across all SCITT Statements. This provides a means to query SCITT for statements about specific artifacts, versions of artifacts, issuer identities, or contentTypes for specific versioned artifacts.
2. **Payload**: The unique content placed on a SCITT Registry, related to a specific versioned artifact. The payload schema (content type/`cty`) is defined by the submitter. 

A SCITT statement is a [COSE envelope][cose-env]. The envelope contains protected headers and a payload.

### SBOM Scenario

In this scenario, Wabbit Networks produced the `net-monitor:v1` container image. Wabbit networks wishes to publish an SPDX SBOM for the specific versioned release.
To achieve this, Wabbit Networks publishes a notarized SBOM, assuring the issuing identity is Wabbit Networks.

### Persistance Options

When discussing how statements are persisted, we need to think about the amount and type of data placed on the ledger.

How can a ledger:

1. Provide verifiable statements about a versioned artifact
1. Be maintained for long (decades) amount of time without concern of storage costs and/or reliability
1. Not directly maintain information that may need to be purged for compliance reasons, yet be able to maintain a reference to the existence of a statement.

A SCITT instance can contain the statement payload directly on the ledger, or the payload can be a reference to content stored externally to the Ledger.

#### Option 1: SBOM Placed On the SCITT Ledger

In this case the SBOM content is placed directly on the SCITT Ledger. This has the benefit of simplicity, but does risk a Ledger having too much content, or content that may not be made public.

```cose
COSE header:
cty = "application/spdx+json"
artifact-id = "sha256:48575dfb9ef2ebb9d67c6ed3cfb..."
artifact-location = "docker.io/wabbitnetworks/net-monitor"

payload:
bstr {
   <spdx.json inline>
}
```

<img src="/assets/statement-on-ledger.svg" alt="Consuming Public Content" style="width:600px;"/>

#### Option 2: SBOM External To the SCITT Ledger

In this example, the SBOM is persisted external to the Ledger, but is notarized. In this workflow, the eNotary countersigns a hash (digest) of the SBOM, providing a verifiable receipt.

This has the benefit of keeping the Ledger content small, but adds the complexity of having to persist the SBOM external to the ledger.

```cose
COSE header:
cty = "application/vnd.ietf.scitt.content-reference+json"

payload:
{
  "digest": "sha256:e8ec820235ffa24968b3474dc...",
  "mediaType": "application/spdx+json",
  "location": "scitt.wabbit-networks.io/net-monitor"
}
```


<img src="/assets/statement-link-from-ledger.svg" alt="Consuming Public Content" style="width:600px;"/>

#### Mitigating External Storage Challenges

When eBay launched in 1995, it didn't provide image hosting. This meant users would have to firs upload their product images somewhere, then reference them with html tags in the content of their post. As the auction ended, users would then have to manage the purging of the orphaned images. This impacted the usability of eBay, which prompted the creation of [eBay Picture Services](https://pages.ebay.com/cl/en-us/sell/pictureservices/)

To assure a Ledger can meet the scaling, reliability and longevity goals, a SCITT instance MAY provide a default storage service for external links. The SCITT APIs will provide a means to ingest submitted content, create the hash, sign the content. 

[cose-env]:               https://datatracker.ietf.org/doc/html/rfc8152#section-5.1
[rfc6838]:      https://www.rfc-editor.org/rfc/rfc6838
