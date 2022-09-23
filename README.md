# Snakemake—simple data processing for researchers (My talk in 2022)
[Link to the slides][gh-pages].

[gh-pages]: https://blog.liang2.tw/2022Talk-snakemake/
[workflow-status]: https://github.com/ccwang002/2022Talk-snakemake/actions/workflows/publish.yml


## Abstract
Snakemake is a flexible workflow engine to build reproducible and scalable bioinformatics data analyses.
Workflows are described in Makefile-like syntax and support custom Python functions.
In this talk, I will share my experience as a researcher on how to use Snakemake to put together a data processing pipeline easily and scale up the pipeline to large number of samples on multiple computing platforms (e.g., local server, HPC, and cloud).
I will also talk about lessons/best practices I learned while adopting Snakemake to my data processing and analyses.

Snakemake 是一個靈活易用的 workflow engine，用來建立一個可再現、可擴展的生物資訊分析流程。它的 workflow 近似 Makefile 語法，並能在流程中呼叫自訂的 Python 函式。我會分享以我一個研究員的經驗，如何用 Snakemake 改寫我研究用的資料處理流程來處理大量的樣本，並且把同個流程跑在不同環境（本地伺服器、HPC、雲端）。我也會分享我在資料處理、資料分析研究時使用 Snakemake 所學到的心得與技巧。


## How to build the slides
[![Page build status](https://github.com/ccwang002/2022Talk-snakemake/actions/workflows/pages/pages-build-deployment/badge.svg)][workflow-status]

First, set up the node.js environment:

    npm install     # Install the dependencies
    npm start       # Start live reloading by browsersync
    npm test        # Run CSS style check using stylelint

To publish the bundled presentation to GitHub Pages, run:

    npm run bundle      # Create standalone bundle
    npm run publish     # Push the bundle to GitHub Pages

This repo also sets up the GitHub workflow that will automatically bundle and publish the presentations on every git push.
The workflow produces a bundled presentation as a compressed file `slides.zip`.

The bundled presentation contains a standalone webpage that can be viewed offline.
Simply open the file `index.html` in a web browser to start the presentation and view the notes.


## License
The theme is shared under [MIT license](LICENSE.md).
It directly modifies the official [Material][Material theme] theme ([the original license][Material license]) and will be in sync with upstream updates.

The theme builds on the following packages and resources:

- Shower's official theme, [Material][Material theme], [MIT License][Material license]
- [Shower]: HTML5 presentation framework by Vadim Makeev *et al.*, MIT license
- [highlight.js]: Code highlighting library by Ivan Sagalaev *et al.*, MIT license
- Fonts:
    - [Source Sans], SIL Open Font License 1.1
    - [Fira Code], SIL Open Font License 1.1

[Material theme]: https://github.com/shower/material
[Material license]: LICENSE.shower_material.md
[shower]: https://github.com/shower/shower
[highlight.js]: http://highlightjs.org/
[Source Sans]: https://github.com/adobe-fonts/source-sans
[Fira Code]: https://github.com/tonsky/FiraCode
