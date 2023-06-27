# outpack.server

**DEPRECATED: use [outpack_server](https://github.com/mrc-ide/outpack_server) instead**

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R build status](https://github.com/mrc-ide/outpack.server/workflows/R-CMD-check/badge.svg)](https://github.com/mrc-ide/outpack.server/actions)
[![Build status]()](https://buildkite.com/mrc-ide/outpack-dot-server?branch=main)
[![codecov.io](https://codecov.io/github/mrc-ide/outpack.server/coverage.svg?branch=main)](https://codecov.io/github/mrc-ide/outpack.server?branch=main)
<!-- badges: end -->

This is an implementation of the [outpack](https://mrc-ide.github.io/outpack) HTTP API as an R package using [porcelain](https://reside-ic.github.io/porcelain/) and [plumber](https://docs.rstudio.com/resources/plumber/). We will probably replace this with a higher performance implementation later, but keep the interface the same.




## Usage

Assuming that you have an outpack repository at `path`:

```bash
docker run -v ${PWD}/path:/outpack -p 8001:8001 mrcide/outpack.server:prototype /outpack
```

### Responses


```
## ℹ Loading outpack.server
```

### GET /

```json{
    "status": "success",
    "errors": null,
    "data": {
        "outpack": "0.1.4",
        "outpack.server": "0.1.0"
    }
}
```

### GET /metadata/list

```json{
    "status": "success",
    "errors": null,
    "data": [
        {
            "packet": "20220812-155808-c873e405",
            "time": "2022-08-12 15:58:08",
            "hash": "sha256:df6edb3d6cd50f5aec9308a357111592cde480f45a5f46341877af21ae30d93e"
        },
        {
            "packet": "20220812-155808-d5747caf",
            "time": "2022-08-12 15:58:08",
            "hash": "sha256:edc70ef51e69f2cde8238142af29a9419bb27c94b320b87e88f617dfc977a46b"
        },
        {
            "packet": "20220812-155808-dbd3ce81",
            "time": "2022-08-12 15:58:08",
            "hash": "sha256:a7da8c3464a2da4722b9d15daa98eb13f4f8c1949c6d00100428b2e9d0668f29"
        },
        {
            "packet": "20220812-155808-e21bc5fc",
            "time": "2022-08-12 15:58:08",
            "hash": "sha256:df1b91aaf3393483515ac61596aa35117891eacc533a55ec2f4759d0036514f9"
        }
    ]
}
```

### GET /metadata/<id>

```json{
    "status": "success",
    "errors": null,
    "data": {
        "schemaVersion": "0.0.1",
        "name": "a",
        "id": "20220812-155808-c873e405",
        "time": {
            "start": 1660319888.7832,
            "end": 1660319888.7835
        },
        "parameters": null,
        "files": [
            {
                "path": "data.rds",
                "size": 112,
                "hash": "sha256:8690e67e8f46e228f003f94aed69d216bfbfee0bf2e9ab5ecf894b9926382278"
            }
        ],
        "depends": [

        ],
        "script": [

        ],
        "session": {
            "platform": {
                "version": "R version 4.2.1 (2022-06-23)",
                "os": "Ubuntu 20.04.4 LTS",
                "system": "x86_64, linux-gnu"
            },
            "packages": [
                {
                    "package": "outpack.server",
                    "version": "0.1.0",
                    "attached": true
                },
                {
                    "package": "testthat",
                    "version": "3.1.4",
                    "attached": true
                },
                {
                    "package": "Rcpp",
                    "version": "1.0.9",
                    "attached": false
                },
                {
                    "package": "pillar",
                    "version": "1.8.0",
                    "attached": false
                },
                {
                    "package": "compiler",
                    "version": "4.2.1",
                    "attached": false
                },
                {
                    "package": "later",
                    "version": "1.3.0",
                    "attached": false
                },
                {
                    "package": "prettyunits",
                    "version": "1.1.1",
                    "attached": false
                },
                {
                    "package": "remotes",
                    "version": "2.4.0",
                    "attached": false
                },
                {
                    "package": "tools",
                    "version": "4.2.1",
                    "attached": false
                },
                {
                    "package": "pkgbuild",
                    "version": "1.3.1",
                    "attached": false
                },
                {
                    "package": "docopt",
                    "version": "0.7.1",
                    "attached": false
                },
                {
                    "package": "pkgload",
                    "version": "1.3.0",
                    "attached": false
                },
                {
                    "package": "tibble",
                    "version": "3.1.8",
                    "attached": false
                },
                {
                    "package": "evaluate",
                    "version": "0.15",
                    "attached": false
                },
                {
                    "package": "jsonlite",
                    "version": "1.8.0",
                    "attached": false
                },
                {
                    "package": "memoise",
                    "version": "2.0.0",
                    "attached": false
                },
                {
                    "package": "lifecycle",
                    "version": "1.0.1",
                    "attached": false
                },
                {
                    "package": "pkgconfig",
                    "version": "2.0.3",
                    "attached": false
                },
                {
                    "package": "rlang",
                    "version": "1.0.4",
                    "attached": false
                },
                {
                    "package": "cli",
                    "version": "3.3.0",
                    "attached": false
                },
                {
                    "package": "rstudioapi",
                    "version": "0.13",
                    "attached": false
                },
                {
                    "package": "curl",
                    "version": "4.3.2",
                    "attached": false
                },
                {
                    "package": "xfun",
                    "version": "0.31",
                    "attached": false
                },
                {
                    "package": "fastmap",
                    "version": "1.1.0",
                    "attached": false
                },
                {
                    "package": "stringr",
                    "version": "1.4.0",
                    "attached": false
                },
                {
                    "package": "knitr",
                    "version": "1.39",
                    "attached": false
                },
                {
                    "package": "swagger",
                    "version": "3.33.1",
                    "attached": false
                },
                {
                    "package": "withr",
                    "version": "2.5.0",
                    "attached": false
                },
                {
                    "package": "vctrs",
                    "version": "0.4.1",
                    "attached": false
                },
                {
                    "package": "askpass",
                    "version": "1.1",
                    "attached": false
                },
                {
                    "package": "desc",
                    "version": "1.4.1",
                    "attached": false
                },
                {
                    "package": "fs",
                    "version": "1.5.2",
                    "attached": false
                },
                {
                    "package": "devtools",
                    "version": "2.4.2",
                    "attached": false
                },
                {
                    "package": "rprojroot",
                    "version": "2.0.3",
                    "attached": false
                },
                {
                    "package": "glue",
                    "version": "1.6.2",
                    "attached": false
                },
                {
                    "package": "R6",
                    "version": "2.5.1",
                    "attached": false
                },
                {
                    "package": "processx",
                    "version": "3.7.0",
                    "attached": false
                },
                {
                    "package": "fansi",
                    "version": "1.0.3",
                    "attached": false
                },
                {
                    "package": "porcelain",
                    "version": "0.1.8",
                    "attached": false
                },
                {
                    "package": "sessioninfo",
                    "version": "1.1.1",
                    "attached": false
                },
                {
                    "package": "callr",
                    "version": "3.7.1",
                    "attached": false
                },
                {
                    "package": "purrr",
                    "version": "0.3.4",
                    "attached": false
                },
                {
                    "package": "plumber",
                    "version": "1.1.0",
                    "attached": false
                },
                {
                    "package": "lgr",
                    "version": "0.4.2",
                    "attached": false
                },
                {
                    "package": "magrittr",
                    "version": "2.0.3",
                    "attached": false
                },
                {
                    "package": "ps",
                    "version": "1.7.1",
                    "attached": false
                },
                {
                    "package": "promises",
                    "version": "1.2.0.1",
                    "attached": false
                },
                {
                    "package": "ellipsis",
                    "version": "0.3.2",
                    "attached": false
                },
                {
                    "package": "usethis",
                    "version": "2.0.1",
                    "attached": false
                },
                {
                    "package": "webutils",
                    "version": "1.1",
                    "attached": false
                },
                {
                    "package": "utf8",
                    "version": "1.2.2",
                    "attached": false
                },
                {
                    "package": "V8",
                    "version": "4.2.0",
                    "attached": false
                },
                {
                    "package": "stringi",
                    "version": "1.7.6",
                    "attached": false
                },
                {
                    "package": "outpack",
                    "version": "0.1.4",
                    "attached": false
                },
                {
                    "package": "openssl",
                    "version": "1.4.5",
                    "attached": false
                },
                {
                    "package": "cachem",
                    "version": "1.0.5",
                    "attached": false
                },
                {
                    "package": "crayon",
                    "version": "1.5.1",
                    "attached": false
                },
                {
                    "package": "brio",
                    "version": "1.1.3",
                    "attached": false
                }
            ]
        },
        "custom": null
    }
}
```

### GET /file/<hash>

```json1f 8b 08 00 00 00 00 00 00 03 ...```

## Installation

To install `outpack.server`:

```r
remotes::install_github("mrc-ide/outpack.server", upgrade = FALSE)
```

## Schema

The `outpack` schema is imported into this package by running `./scripts/import_schema`, and needs to be 
kept manually up to date by re-running that script as needed.

## License

MIT © Imperial College of Science, Technology and Medicine
