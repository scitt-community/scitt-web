# What Is SCITT

SCITT represents a set of standards, enabling a secure **S**upply **C**hain, with **I**ntegrity and **T**rust.
Ok, that's the acronym, but what is SCITT?

SCITT provides information about artifacts, enabling a mesh of dependencies to understand what each system is consuming. Detailed information comes in varying formats, from structured to unstructured.

In SCITT, structured data is a claim. A claim is a well-structured statement, made by a verifiable entity that may have supporting evidence.

<img src="media/claims-evidence-relationship.png" alt="Identity, Claim, Evidence, Artifact relationship" style="width:300px;"/>

However, documenting claims at the time software is built or deployed would sell SCITT short, as software isn't static. Software is continually updated, and more importantly, we continually learn and want to convey new information about artifacts that have already been release. Reputable OSS Projects and Independent Software Vendors (ISVs) don't intentionally produce software they know to be vulnerable. Only after the software is public do we often find out about new vulnerabilities. SCITT is a means to convey a stream of continual updates for each versioned artifact.

## SCITT Persistance

SCITT is intended to store verifiable claims for the life of the of the SCITT instance. One of the many questions that surfaces is how big will the SCITT leger get? What kind of data will go on the SCITT ledger that would cause it to grow?

### eNotary

SCITT is analogous to a digital, or electronic notary service (eNotary), where minimal information is written to the ledger, endorsing the claim. When users notarize legal documents, the notary ledger records the verified identity of the parties, referencing the legal document they are notarizing. The notary ledger doesn't store the legal document, but does have a reference to it. 

In SCITT, the ledger will contain pointers to the artifact, which the claims are made, with pointers to any supporting evidence.

### Evidence Persistance

A SCITT instance will persist verifiable claims to its ledger. Any optional evidence will be persisted in associated storage. 

<img src="media/scitt-persistence.png" alt="SCITT persistance" style="width:600px;"/>

While a SCITT instance should provide a default storage, there's no limit on what storage services are used. For package managers that support breadths of content types, the evidence may be stored alongside the artifact by which the claim is being made. For package managers that limit the content types to the specific package type, a SCITT instance should provide default storage persistance.

> TO BE CONTINUED