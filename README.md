resume
* * *

Grahame Murray's resume, generated in multiple formats

> [!IMPORTANT]
> This repo is archived. https://github.com/gusnuf/grahame.com now includes this content

### Dependencies
ant and fop are required

Edit `data/resume.xml` to contain the appropriate resume contents

set the `FOP_HOME` environment variable to the root of the installed FOP

Run `ant` in the root directory of this project

This will produce many versions of the resume in the `dist` directory

```shell
brew install ant fop
export FOP_HOME=/usr/local/Cellar/fop/2.3/libexec/fop/
ant
```
