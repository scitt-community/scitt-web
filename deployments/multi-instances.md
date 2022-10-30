---
layout: page
title:  "Multiple Instances of SCITT"
parent: Supply Chains
nav_order: 3
---

# Multiple Instances of SCITT

This document frames the design philosophy for multiple instances of SCITT, and how they interoperate with each other.

## Topics to Cover

- One global instance for all package types (public and private)
  - The simplicity with the pros and cons
- Instances aligned with the distribution of projects & products
  - A single instance for each software vendor/oss project?
  - Instances of SCITT alongside the existing package managers/distribution points
- Private instances, for companies to manage their internal development
- How SCITT information is promoted across instances, and maintained as a constant stream of updates
- Public anonymous access
- Public authenticated access
- Private authenticated access