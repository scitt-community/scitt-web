---
layout: page
title:  Extending Services
parent: Scenarios
nav_order: 1
---

# Extending Existing Services and Projects with SCITT

The IETF SCITT standards are designed to extend existing projects, products and services with a standards based way to push, discover, pull supply chain claims and evidence.

## Adding SCITT APIs

SCITT provides a set of API for pushing, discovering and pulling supply chain claims and evidence, and a minimal set of payload specifications for what would be submitted to the ledger.

By extending existing projects, products and services with SCITT apis, the users of the existing projects will see value added to their services without having to configure yet another service, or configure yet more firewall rules.

<img src="/assets/interoperability.svg" alt="Consuming Public Content" style="width:800px;"/>

1. ACME Rockets uses the Spacley Cloud Provider. Although they run in a public cloud, they run their secure environments within private networks (VNet).
2. The Spacley Cloud provides a set of cloud services, which provide VNet projection enabling their customers to run their private environments in a public cloud.
3. ACME Rockets runs their [OCI Distribution][oci-distribution-spec]{:target="_blank"} based registry, configured as `registry.acmerockets.io`, which is projected into the VNet with no public access.
4. ACME Rockets runs a kubernetes cluster, configured with OPA Gatekeeper plugin which provides SCITT APIs. This allows deployment verifications to operate completely within their private network, while benefiting from the SCITT capabilities that were projected through the [OCI Distribution extension APIs][oci-distribution-extension]{:target="_blank"}.  
  ***But wait, there's more:***
5. Wabbit Networks provides security scanning services. Their security service uses the SCITT APIs to project a standard set of claims, attestations and security insight. 
6. ACME Rockets runs the Wabbit Networks security products on their containers and compute infrastructure.

Just as [HTTP protocol][http-spec] enabled a rich ecosystem of internet communication, the SCITT APIs aim to standardize Supply Chain, Integrity and Trust interoperability.

[http-spec]:                  http://127.0.0.1:4000/scenarios/extending-existing-services.html
[oci-distribution-spec]:      https://github.com/opencontainers/distribution-spec
[oci-distribution-extension]: https://github.com/opencontainers/distribution-spec/tree/main/extensions
