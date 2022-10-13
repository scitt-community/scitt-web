---
layout: default
title: Your Specification
respec: >
  {
    "name": "your-spec-short-name",
    "status": "CG-DRAFT",
    "latest": "https://transmute-industries.github.io/respec-github-pages/spec/latest",
    "repository": "https://github.com/transmute-industries/respec-github-pages",
    "issues": "https://github.com/transmute-industries/respec-github-pages/issues",
    "group": {
      "name": "Credentials Community Group",
      "url": "https://www.w3.org/community/credentials/",
      "list": "public-credentials",
      "patentUri": "https://www.w3.org/community/about/agreements/cla/"
    },
    "editors": [
      {
        "name": "Your Name",
        "url": "https://example.com",
        "company": "Your Company",
        "companyURL": "https://example.com"
      }
    ],
    "bibliography": {
      "RDF-DATASET-NORMALIZATION": {
        "title": "RDF Dataset Normalization 1.0",
        "href": "http://json-ld.github.io/normalization/spec/",
        "authors": ["David Longley", "Manu Sporny"],
        "status": "CGDRAFT",
        "publisher": "JSON-LD Community Group"
      }
    }
  }
---

<section id="abstract">
  <p>
    Your specification abstract goes here.
  </p>
</section>

<section id="sotd">
  <p>
    This is an experimental specification and is undergoing regular
    revisions. It is not fit for production deployment.
  </p>
</section>

<section id="terminology">
  <h2>Terminology</h2>
  <p>
    Your specification terminology goes here.
  </p>
</section>

<style>
.red43 {
  color: red;
}
</style>

<p class="red43">Custom CSS is Supported!</p>

## Markdown is Supported !

<p>
Example link to bibliography here... [[RDF-DATASET-NORMALIZATION]].
</p>

#### Example:

```json
{
  "id": "did:example:123#key-0",
  "controller": "did:example:123",
  "type": "JsonWebKey2020",
  "publicKeyJwk": {
    "crv": "secp256k1",
    "kty": "EC",
    "x": "dWCvM4fTdeM0KmloF57zxtBPXTOythHPMm1HCLrdd3A",
    "y": "36uMVGM7hnw-N6GnjFcihWE3SkrhMLzzLCdPMXPEXlA"
  }
}
```

<section data-dfn-for="Foo" data-link-for="Foo">
  <h2>Start your spec!</h2>
  <pre class="idl">
  interface Foo {
    attribute Bar bar;
    undefined doTheFoo();
  };
  </pre>
  <section>
    <h2><dfn>bar</dfn> attribute</h2>
    <p>When getting, the <a>bar</a> attribute returns you a 🍹.</p>
  </section>
  <section>
    <h2><dfn>doTheFoo(DOMString thing)</dfn> method</h2>
    <p>When called, <code>doTheFoo(<var>thing</var>)</code> it MUST behave as follows:</p>
    <ol class="algorithm">
      <li>If <var>thing</var>....</li>
      <li>Let <var>someProp</var>... of the [[!DOM]] spec.</li>
    </ol>
  </section>
</section>

<section id='conformance'>
  <!-- This section is filled automatically by ReSpec. -->
</section>