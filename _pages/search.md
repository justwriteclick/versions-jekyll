---
layout: single
title: Search
search: false
permalink: /search/
---

Powered by <a href="https://lunrjs.com/">lunr.js</a>.

<br/>&nbsp;
<form action="get" id="site_search">
<center>
  <input style="font-size:20px;" type="text" id="search_box">
  <input style="font-size:20px;" type="submit" value="Go!">
</center>
</form>
<br/>&nbsp;
<br/>&nbsp;

<ul id="search_results"></ul>

<script src="{{ site.baseurl }}/assets/js/lunr/lunr.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="{{ site.baseurl }}/assets/js/lunr/search.js"></script>

