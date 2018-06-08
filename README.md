resume
* * *

Grahame Murray's resume, generated in multiple formats
[![Build Status](https://travis-ci.org/gusnuf/resume.svg?branch=master)](https://travis-ci.org/gusnuf/resume)

### Dependencies
ant and fop are required


### Running
Edit `data/resume.xml` to contain the appropriate resume contents

set the `FOP_HOME` environment variable to the root of the installed FOP

Run `ant` in the root directory of this project

This will produce many versions of the resume in the `dist` directory

```shell
brew install ant fop
export FOP_HOME=/usr/local/opt/fop
ant
```
