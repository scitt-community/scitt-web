---
layout: page
title:  # Feed Requirements
parent: Examples
nav_order: 5
---

# Feed Requirements

1. Ability to associate a collection of statements to a root artifact
   -. When submitting an SBOM, Vex, Statement of Quality, Recommendation for a new version, all need a simple id to associate them to a common artifact.
1. To know a specific identity created the unique Feed ID
   - If **Wabbit Networks** creates a feed ID of `abc-123`, other parties should know they're making additional statements to that unique ID
   - **BadCo** shouldn't be able to create an alternate version of `abc-123` that fools other parties to submitting statements
   - The determination that **Wabbit Networks** is a good entity and **BadCo** is a bad entity is outside the scope of SCITT
   - SCITT should prohibit the creation of Feed IDs that can be duped by another entity
1. Feeds produce a lineage of statements about a root artifact. The root artifact is arbitrary and may not be a specific file or asset
   - A binary may be versioned over time, and the producer may decide to store different platform/architecture based versions on different feeds
   - A document that is edited over time, may be kept on the same feed to see it's changes over time
1. Feeds are not unique to a location. **Wabbit Networks** may host a feed for their net-monitor software
   - Cosmic Security independently evaluates software, providing a rating  
     They offer a SCITT Service with statements of quality to other products and projects. On the Cosmic Security scitt instance, the have a Feed-ID from **Wabbit Networks**
   - The SCITT Transparent Statements are signed by Cosmic Security
   - ACME Rockets can consume the software from Wabbit Networks, and statements of quality from Cosmic Security. They associate them by the Feed-Id
   - ACME Rockets chooses to trust statements from Cosmic Security
