# outpack.server

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R build status](https://github.com/mrc-ide/outpack.server/workflows/R-CMD-check/badge.svg)](https://github.com/mrc-ide/outpack.server/actions)
[![Build status]()](https://buildkite.com/mrc-ide/mrcide/outpack-dot-server?branch=main)
[![codecov.io](https://codecov.io/github/mrc-ide/outpack.server/coverage.svg?branch=main)](https://codecov.io/github/mrc-ide/outpack.server?branch=main)
<!-- badges: end -->

This is an implementation of the [outpack](https://mrc-ide.github.io/outpack) HTTP API as an R package using [porcelain](https://reside-ic.github.io/porcelain/) and [plumber](https://docs.rstudio.com/resources/plumber/). We will probably replace this with a higher performance implementation later, but keep the interface the same.

## Installation

To install `outpack.server`:

```r
remotes::install_github("mrc-ide/outpack.server", upgrade = FALSE)
```

## License

MIT © Imperial College of Science, Technology and Medicine
