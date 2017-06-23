---
title: Example version collection landing page
layout: single
permalink: /
author_profile: false
---

This page is the landing page for the root index.html.

For each new release, add it to the collections in `_config.yaml`,
and also create a landing page at `_version/index.md`.

Each release will have a branch or tag associated with that point-in-time.

Each branch/tag has a copy of all content in markdown.

At build time, take each branch, make a copy, and copy all the markdown content and folders into each `_release` folder, for each branch.

New releases are automatically listed in the top navigation.

`page.collection` is: {{ page.collection }}

`site.collection` is: {{ site.collection }}
