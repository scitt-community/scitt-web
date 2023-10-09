---
layout: page
title:  # Feed Basic Example
parent: Examples
nav_order: 20
---

# Feed Basic Example

SCITT provides the registration, persistance and querying of a series of Transparent Statements over the life of the Artifact.

Producers and Third Parties create and register Signed Statements on one or more SCITT Services. And Consumers query one or more SCITT Services for information about software they wish to evaluate.

To demonstrate how SCITT Implements this workflow, a collection of scenarios and examples are provided using the [SCITT Community API Emulator](https://github.com/scitt-community/scitt-api-emulator) and [SCITT.xyz](https://scitt.xyz)

## Scenario: Series of Transparent Statements Over the Life of an Artifact

As a producer publishes a software artifact, they make a SCITT Feed available to provide a series of statements about the Artifact.

For this example, we'll use the [Wabbit Networks](./fictitious-companies.md#wabbit-networks) Network Monitor Software.
Using SCITT Terminology, the Artifact is a specific versioned release of the net-monitor binary.
And a Feed is created to provide the series of Statements about the Artifact.

Put simply, a Feed represents a specific Artifact, with a series of statements placed on the Feed.

**Note:** _For the examples below, the contents of statements are opaque to the SCITT Service.
The SCITT Service doesn't parse or understand what an SBOM, VEX, Patch, New Version is.
The Transparent Statements have a `contentType` that enables clients to parse the specific content types._

1. On January 1, 2023 Wabbit Networks publishes V1 of their Net-Monitor software, targeting Linux environments
2. At the time of release, Wabbit Networks publishes SBOMs in both SPDX and Cyclone DX Formats, as well as a Security Scan Result from [Cosmic Security](./fictitious-companies.md#cosmic-security)
3. As time progresses, and new issues are discovered about components used within the build and release of the net-monitor binary, Wabbit Networks releases updated Scan Reports and updated VEX reports
4. As new patches are released, Wabbit Networks updates the Feed with information that informs of the new patched version, which is likely a new Feed
5. As new versions are released, Wabbit Networks updates the relevant Feeds of the new versions, which are likely new Feeds
6. As versions become out of support, Wabbit Networks publishes statements to the feed, indicating End of Support, (also known as EOL)
7. As Wabbit Networks as third parties provide security reviews each Feed, the third party may submit their Signed Statement (the security review) to each Feed

## Overview of the Steps

Ultimately, a Feed is the identifier used to query a series of statements about an Artifact.

A few constructs are assumed:

- A Feed should is defined by the issuer of the artifact
- Other parties can reference the same Feed, making additional statements, signed with their identity
  - Other parties, if permitted by the registration policy of the publishers SCITT instance, can publish Signed Statements to the same Feed
  - To enable autonomy, other parties can publish Signed Statements to a different SCITT instance, about the same Feed
- From a SCITT perspective, the Feed ID is a string as trying to solve the one global unique identifier for software, hardware, content and other types is beyond the scope of SCITT
- Consumers need to be able to find the Feed ID, based on nothing more than having reference to the artifact they wish to discover information
- As SCITT supports Signed Statements, issued by an Identity, the following proposal uses the Identity of the Signed Statement as the Identity associated with the Feed

This does leave open the question, what is the content of Signed Statement that defines the Feed?

1. It could be the binary the Feed is based upon
1. It could be an empty Statement that is simply used as the anchor for the feed, where the binary is subsequently added as one of the many contents associated with the Feed

### Binary in the Feed Identifier

In this scenario, the net-monitor binary is the content of the Statement used to initiate the Feed ID.

The benefits include a bit of simplicity as there's less abstraction as the binary=the feed.

1. Create a Signed Statement that identifies the Feed Id

    ```sh
    --content-type application/octet-stream
    --payload "@net-monitor"
    --identity <Wabbit Networks Key Material>
    --Feed <nil>
    --Reg_Info content-hash: <hash of the net-monitor binary> # used for subsequent querying
    ```

2. Register the signed statement to the SCITT Instance
3. Capture the Entry ID as the Feed ID

As a result, there is one Transparent Statement on the append-only ledger representing the binary and the Feed.

Subsequent statements, such as the SBOMs, VEX and Scan Reports use the above Feed ID

### Empty Statement as the Feed Identifier

In this scenario, a statement is created that effectively has no content.
While content could be created, it infers the SCITT Service would need to understand the `contentType` of the Statement.

The benefits of this approach is the Feed isn't tied to a specific binary or file.
This supports additional scenarios where someone is either tracking physical goods, or a document, (contract), which may change over time.

**Note:** _By abstracting the Feed ID from a specific file, the application layer can query for specific content types, allowing a document to evolve over time.
The consumer could ask if `<file hash>` is the latest version, and the service could provide the version history of that `contentType` (to elaborate in the document scenario)._

1. Create a Signed Statement that identifies the Feed Id

    ```sh
    --contentType application/scitt/feed # maybe
    --payload <nil>
    --identity <Wabbit Networks Key Material>
    --Feed <nil>
    --Reg_Info name: <arbitrary name> # used for subsequent querying
    ```

1. Register the signed statement to the SCITT Instance, representing the Feed ID
1. Capture the Entry ID as the Feed ID
1. Create a Signed Statement for the root artifact: the `net-monitor` v1 binary _(similar to step 1 of above [Binary in the Feed Identifier](#binary-in-the-feed-identifier) )_

    ```sh
    --content-type application/octet-stream
    --payload "@net-monitor"
    --identity <Wabbit Networks Key Material>
    --Feed <Entry ID from the above statement>
    --Reg_Info content-hash: <hash of the net-monitor binary> # used for subsequent querying
    ```

1. Register the Signed Statement, with the Feed Id

As a result, there are Two Transparent Statements on the append-only ledger representing the Feed, and the first entry representing a file on the Feed.

Subsequent statements, such as modifications to the file (contract updates, scans of human wet/digital signatures), redirects to newer versions, updated contractual submission dates, use the above Feed ID
