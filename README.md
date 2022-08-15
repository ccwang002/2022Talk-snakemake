# Snakemake—simple data processing for researchers (2022 Talk)
[![Page build status](https://github.com/ccwang002/2022Talk-snakemake/actions/workflows/pages/pages-build-deployment/badge.svg)][workflow-status]

[See it in action][gh-pages].

[gh-pages]: https://blog.liang2.tw/2022Talk-snakemake/
[workflow-status]: https://github.com/ccwang002/2022Talk-snakemake/actions/workflows/publish.yml


## How to build the slides
First, set up the node.js environment:

    npm install     # Install the dependencies
    npm start       # Start live reloading by browsersync
    npm test        # Run CSS style check using stylelint

To publish the bundled presentation to GitHub Pages, run:

    npm run bundle      # Create standalone bundle
    npm run publish     # Push the bundle to GitHub Pages

This repo also sets up the GitHub workflow that will automatically bundle and publish the presentations on every git push.


## License
The theme is shared under [MIT license](LICENSE.md).
It directly modifies the official [Material][material theme] theme ([the original license][material-orig-license]) and will be in sync with upstream updates.

The theme builds on the following packages and resources:

- Shower's official theme, [Material][Material theme], [MIT License][Material license]
- [Shower]: HTML5 presentation framework by Vadim Makeev *et al.*, MIT license
- [highlight.js]: Code highlighting library by Ivan Sagalaev *et al.*, MIT license
- Fonts:
    - [Source Sans]: SIL Open Font License 1.1
    - [Fira Code]: SIL Open Font License 1.1

[Material theme]: https://github.com/shower/material
[Material license]: LICENSE.shower_material.md
[shower]: https://github.com/shower/shower
[highlight.js]: http://highlightjs.org/
[Source Sans]: https://github.com/adobe-fonts/source-sans
[Fira Code]: https://github.com/tonsky/FiraCode
