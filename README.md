Check the build site here: [https://stghuniverse.z45.web.core.windows.net/#0](https://stghuniverse.z45.web.core.windows.net/#0)

How to build the codelabs from its markdown source:
```
scripts/build-codelab.sh <name of the markdown file>
```

Example:
```
scripts/build-codelab.sh workshop.md
```

This wraps `claat export` with a local template (`build/claat-template.html`) that
loads the `google-codelab` web components from `assets/codelab-elements/` instead
of `https://storage.googleapis.com/claat-public/`, which stopped serving files
(the bucket's billing account was disabled). The script also copies
`assets/codelab-elements/` into the exported deck's folder as `codelab-elements/`,
so each deck stays self-contained for local preview and for the Azure deploy step.

To customize the codelab look and feel, edit `assets/codelab-elements/codelab-elements.css`
directly and re-run the build script for the decks you want to update.

Requires the `claat` binary at `~/go/bin/claat` (override with the `CLAAT_BIN` env var).

To serve the resulting codelabs locally, run:
```
~/go/bin/claat serve
```
This starts a local web server (default http://localhost:9090) in the current directory, serving the generated codelab folders. Open the URL in your browser to preview your codelabs.

The value of `id` in the header of the markdown file determines the name of folder for the built HTML file.

On the github workflow, the file that will be built is the `workshop.md` file. So if you need it to be deployed online, make sure the latest one is `workshop.md`.
Push to `upstream` ([https://github.com/eComindo/2025-Github-Copilot-Workshop-long-eng](https://github.com/eComindo/2025-Github-Copilot-Workshop-long-eng)) to build in the build site mentioned above.
```
git push upstream
```