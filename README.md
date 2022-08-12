# outpack.server

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R build status](https://github.com/mrc-ide/outpack.server/workflows/R-CMD-check/badge.svg)](https://github.com/mrc-ide/outpack.server/actions)
[![Build status]()](https://buildkite.com/mrc-ide/outpack-dot-server?branch=main)
[![codecov.io](https://codecov.io/github/mrc-ide/outpack.server/coverage.svg?branch=main)](https://codecov.io/github/mrc-ide/outpack.server?branch=main)
<!-- badges: end -->

This is an implementation of the [outpack](https://mrc-ide.github.io/outpack) HTTP API as an R package using [porcelain](https://reside-ic.github.io/porcelain/) and [plumber](https://docs.rstudio.com/resources/plumber/). We will probably replace this with a higher performance implementation later, but keep the interface the same.




## Usage

Assuming that you have an outpack repository at `path`:


```r
docker run -v ${PWD}:/outpack -p 8001:8001 mrcide/outpack.server:prototype /outpack
```

```
## Error: <text>:1:8: unexpected symbol
## 1: docker run
##            ^
```

### Responses


```
## ℹ Loading outpack.server
```

### GET /

```{
    "status": "success",
    "errors": null,
    "data": {
        "outpack": "0.1.4",
        "outpack.server": "0.1.0"
    }
}
```

### GET /metadata/list

```{
    "status": "success",
    "errors": null,
    "data": [
        {
            "packet": "20220812-151659-08e7831e",
            "time": "2022-08-12 15:16:59",
            "hash": "sha256:a0e8462e48be1dfb874e08c5b9b0e00520208b18beee0f8e9bdf54be3bdc8b5f"
        },
        {
            "packet": "20220812-151659-15b10223",
            "time": "2022-08-12 15:16:59",
            "hash": "sha256:5787a82395b16cf45ae463e91051df2f3223140076b3bc3964c803b1e422bac9"
        },
        {
            "packet": "20220812-151659-1c24b3f0",
            "time": "2022-08-12 15:16:59",
            "hash": "sha256:674bc91875d906c3734e403d05220f7f7696a414628ee1c0e2cf961a7f16af98"
        },
        {
            "packet": "20220812-151659-22fb492f",
            "time": "2022-08-12 15:16:59",
            "hash": "sha256:0192120869f1653da489b096af1945a04948c5d4c325f56622b2b9ce834fa57b"
        }
    ]
}
```

### GET /metadata/<id>

```{
    "status": "success",
    "errors": null,
    "data": {
        "schemaVersion": "0.0.1",
        "name": "a",
        "id": "20220812-151659-08e7831e",
        "time": {
            "start": 1660317419.035,
            "end": 1660317419.0352
        },
        "parameters": null,
        "files": [
            {
                "path": "data.rds",
                "size": 112,
                "hash": "sha256:39ff1019980fc94824e97ce20334991becf8bd2754b93b6906dd182c6b0414d0"
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

```1f 8b 08 00 00 00 00 00 00 03 ...```

## Installation

To install `outpack.server`:

```r
remotes::install_github("mrc-ide/outpack.server", upgrade = FALSE)
```

## License

MIT © Imperial College of Science, Technology and Medicine
