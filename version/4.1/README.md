# [Test for versions](http://docslikecode.com)

Fork me! This way you can see for yourself how versioning works on web sites where the source files are in GitHub.

## Source (files and folders under version control)

GitHub organization/repository:

```
_4.1.yml
_4.1.1.yml
_config.yml
release-notes.md
install-guide/introduction.md
install-guide/preparation.md
install-guide/confirmation.md
install-guide/production.md
```

The `_4.1.yml` build configuration file contains:

```
source: ''
destination: _site/versions/4.1
```

Build with these commands, incrementally, so that the files are copied into a _site directory:

```
$ bundle exec jekyll build --config _config.yml
$ bundle exec jekyll build --config _4.1.yml
```

## Output (static site files and folders)

docs.example.com

```
4.1/index.html
4.1/release-notes/
4.1/install-guide/introduction/
4.1/install-guide/preparation/
4.1/install-guide/confirmation/
4.1/install-guide/production/
4.1.1/index.html
4.1.1/release-notes/
4.1.1/install-guide/introduction/
4.1.1/install-guide/preparation/
4.1.1/install-guide/confirmation/
4.1.1/install-guide/production/
```




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
