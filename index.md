---
title: Example Jekyll version landing page
layout: splash
permalink: /
author_profile: true
header:
  overlay_color: "#6fa81e"
  cta_label: "<i class='fa fa-terminal'></i> Go to repo"
  cta_url: "https://github.com/justwriteclick/versions-jekyll/"
---

This page is the landing page for the baseurl's root index.html, which builds to either `n.n/index.html` or `latest/index.html`, but the should also have a root index.html.

Read the [Cool Service User Guide]({{base_path}}/versions-jekyll/latest/user-guide/).


Read the [Cool Service Install Guide]({{base_path}}/versions-jekyll/latest/install-guide/).

For each new release, build with a `_config.n.n.yml` file in addition to the `_config.yml` file which builds to a `baseurl` of `repo-name/current`.