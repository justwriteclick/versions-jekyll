# [Test for versions](http://docslikecode.com)

Fork me! This way you can see for yourself how versioning works on web sites where the source files are in GitHub, using Jekyll and collections.

- [Source (files and folders under version control)](#source-files-and-folders-under-version-control)
- [Output (static site files and folders)](#output-static-site-files-and-folders)
- [Concepts](#concepts)
- [References](#references)
- [License](#license)

Here are the general concepts:

- The version control of source is done with git through stable branches or tags, but the version control of output does not depend on stable branches.
- The versions of the output are not semantically meaningful, and can have silly names if needed.
- The collection settings in the `_config.yml` sets the destination folder at build time for the versions.
- The output goes to GitHub Pages, in separate folders per release, so that the URL also reflects the version number the person is reading on a page.
- The `master` branch always reflects the current version.
- Minimal Mistakes is the theme in use, which supports collections.
- On the front-end, you'd still need to design for scenarios such as "What if the page I want to access on version 4.1.1 does not exist in version 4.1.1? Do you give a 404 error or a special "not found" page when navigating versions?

## Source (files and folders under version control)

GitHub organization/repository:

```
_config.yml
index.html
_4.1/index.md
_4.1.1/index.md
_pages/release-notes.md
_installguide/introduction.md
_installguide/deployment.md
```

The `_config.yml` build configuration file contains some settings that help with the version control, using collections:

```
# Collections
collections:
  current:
    output: true
    permalink: /:collection/:path
    version: current # Depending on your requirements, you may not need this variable. Also you may be able to default it using :collection, but I haven't tried that.
    title: Latest Release
  "4.1": # quoting version number to avoid the error: undefined method `gsub' for 4.1:Float
    output: true
    permalink: /:collection/:path
    version: "4.1"
    title: Release 4.1 - Lord Chuggington
  "4.1.1":
    output: true
    permalink: /:collection/:path
    version: "4.1.1"
    title: Release 4.1.1 - Bunny Slippers
```

This configuration indicates to Jekyll, "Hey, I want you to output these collections to a /releasenumber directory."

Build with a script, writing the added release number collections into `_config.yml` file for each stable branch.

```
$ bundle exec jekyll build --config _config.yml
```

## Output (static site files and folders)

The website's URL is this: `[https://justwriteclick.github.io/versions-jekyll/](https://justwriteclick.github.io/versions-jekyll/)` and then all the folders below are what are output.

Here's a mapping of what Jekyll data is represented in each portion of the URL. This repo is considered to be a project page from GitHub Page's perspective, so the org name and repo name are both represented.

| Jekyll Variable 	| Portion of URL | Considerations|
|-------------------|----------------|---------------|
| `site.url`        	| `https://orgname.github.io` | What happens when using a user repo or a custom domain name? |
| `site.baseurl`    	| `/repo-name`   | Used with project repos only, set in `_config.yml`. |
| `base_path`       	| `https://orgname.github.io/repo-name`    	| Currently used in cross references, but with a `n.n.n` representing site.collection, would `cross-n.n.n` references always point to `/current`? Is `base_path` only `n.n.n` defined in some themes? 	|
| `site.collection` 	| `/current` or `/4.1` | Defined in `_config.yml`, would need to change `n.n.n` collection based on a `stable/version number` branch or `n.n.n` `master` branch, where /current maps to master branch.                                  	|
| `page.url` | `/install-guide/introduction/index.html` 	| Defined in the permalink metadata in each `.md` file `n.n.n`. Need to have a version of each install guide. |

```
/4.1/index.html
/4.1/release-notes/index.html
/4.1/install-guide/introduction/index.html
/4.1/install-guide/deployment/index.html
/4.1.1/index.html
/4.1.1/release-notes/index.html
/4.1.1/install-guide/introduction/index.html
/4.1.1/install-guide/deployment/index.html
```

## Concepts

I think that there's no way to have nested collections with Jekyll. So you either have to use collections for the versions, and permalink metadata for the guides, or put the version in the permalink metadata.

By using permalink metadata per markdown file for version, you can search-and-replace at release time, replacing `/current` (which remains as the `master` branch permalink) with `/4.1` as the release value.

The website's URL is this: `[https://justwriteclick.github.io/versions-jekyll/](https://justwriteclick.github.io/versions-jekyll/)` and then all the folders below are what are output.

Here's a mapping of what Jekyll data is represented in each portion of the URL. This repo is considered to be a project page from GitHub Page's perspective, so the org name and repo name are both represented.

| Jekyll Variable 	| Portion of URL | Considerations|
|-------------------|----------------|---------------|
| `site.url`         | https://orgname.github.io              | What happens when using a user repo or a custom domain name?                                         |
| `site.baseurl`     | /repo-name                             | Used with project repos only, set in `_config.yml`.         |
| `base_path`        | https://orgname.github.io/repo-name    | Currently used in cross references, but with a version representing site.collection, would cross-references always point to `/current`? Is `base_path` only defined in some themes?                                     |
| `site.collection`  | /current or /4.1 | Defined in _config.yml, would need to change                |
| `collection` | based on a `stable/versionnumber` branch or | `master` branch, where /current maps to master branch.      |
| `page.collection`  | installguide | Defined in the _config.yml.                                 |
| `page.url`         | /install-guide/introduction/index.html | Defined in the permalink metadata in each .md file.         | Need to have a version of each install guide.
 | `permalink: /install-guide/introduction/`                   |



| Jekyll Variable 	| Portion of URL |
|-------------------|---------------------------------------|
| `site.url`         | https://orgname.github.io              |
| `site.baseurl`     | /repo-name                             |
| `base_path`        | https://orgname.github.io/repo-name redirects to:  http://docs.metacloud.com              |
| `site.collection`  | /current or /4.1                       |
| `page.url`         | /install-guide/introduction/index.html |
| `permalink:`       | /install-guide/introduction/           |


## References

http://downtothewire.io/2015/08/15/configuring-jekyll-for-user-and-project-github-pages/

https://mademistakes.com/articles/using-jekyll-2016/

https://mademistakes.com/work/minimal-mistakes-jekyll-theme/

## License

The MIT License (MIT)

Copyright (c) 2017 Michael Rose

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
