# [Test for versions](http://docslikecode.com)

Fork me! This way you can see for yourself how versioning works on web sites where the source files are in GitHub.

Here are the general concepts:

- The version control of source is done with git through stable branches.
- The configuration files set the destination folder at build time.
- The output goes to GitHub Pages, in separate folders, so that the URL also reflects the version number the person is reading on a page.
- The `master` branch always reflects the current version.
- Minimal Mistakes is the theme in use, and that means you have hardcoded URLs in the `navigation.yml` file: https://mademistakes.com/work/minimal-mistakes-jekyll-theme/ 

## Source (files and folders under version control)

GitHub organization/repository:

```
_4.1.yml
_4.1.1.yml
_config.yml
index.html
_version/index.html
_pages/release-notes.md
_installguide/introduction.md
```

The `_4.1.yml` build configuration file contains:

```
url                      : https://justwriteclick.github.io # the base hostname & protocol for the site
baseurl                  : /versions-jekyll # the subpath of the site
version                  : 4.1
source                   : ''
destination              : _site/4.1
```

This configuration indicates to Jekyll, "hey, I want you to take everything buildable in the root of the repo, and output it to a versions/4.1 directory."

This configuration means that 

Build with these commands, incrementally, so that the files are copied into a _site directory:

```
$ bundle exec jekyll build --config _config.yml
$ bundle exec jekyll build --config _4.1.yml
```

## Output (static site files and folders)

The URL is this: `[https://justwriteclick.github.io/versions-jekyll/](https://justwriteclick.github.io/versions-jekyll/)` and then all the folders below are what are output.

```
/4.1/index.html
/4.1/release-notes/
/4.1/install-guide/introduction/
/4.1.1/index.html
/4.1.1/release-notes/
/4.1.1/install-guide/introduction/
```

=======
## References

http://downtothewire.io/2015/08/15/configuring-jekyll-for-user-and-project-github-pages/

https://mademistakes.com/articles/using-jekyll-2016/

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
