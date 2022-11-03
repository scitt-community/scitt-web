---
layout: page
title:  "Artifacts, Claims, Evidence"
parent: Components
nav_order: 1
---

# Relationships between Artifacts, Claims and Evidence

A SCITT Ledger captures claims about artifacts. Claims may have optional evidence, such as an SBOM, VEX or VDR report.

The relationship between a Claim, SCITT and Evidence can be viewed as the following:

<img src="/assets/artifacts-scitt-evidence.svg" alt="Relationships between Artifacts, Claims and Evidence" style="width:800px;"/>

1. Artifacts are stored, where they're stored. These could be container images stored in a registry. various package managers in their registry, binaries on a download center, or drivers on a website/storage account.
2. A "pointer", which is currently thought to be a purl, with a hash as the identity, is used create an identity, that isn't tied to a location. (see [Decoupling Location from Identity - Is this in the scope of purl?#127](https://github.com/package-url/purl-spec/issues/127))
3. SCITT provides ledger services, with [eNotary](enotary.md) to validate trusted identities. The SCITT Ledger will have different forms of persistance, based on the instance.
4. Evidence, such as the SBOM, Vex or VDR Report are persisted in an associated storage account. The receipt from the ledger is stored alongside the evidence, providing verification the evidence was processed by the SCITT eNotary. Most SCITT instances will likely have a default storage system, however SCITT entries should support external storage.
5. A "pointer", currently thought to be a purl, will maintain the identity and location hint between the ledger and the evidence storage. The purl could be yet another location. For example, when an SBOM is submitted to the ledger for eNotarization, it may provide a purl identifier to the eNotary, which is then entered into the ledger. A receipt is then returned.
> Issue: if an external purl is provided for the evidence location, where is the receipt placed? Is it assumed the receipt is placed at the same location as the external purl? 
