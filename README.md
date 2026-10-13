# Lab 01 - Godot 2D Self Introduction

มหาสมุทร แมทิโอ เจแคน | 673380339-5 | AI2

Computer Game Development, first semester 2569.

## Submission links
- Repository: https://github.com/mahasamutmateoj/game-development-lab1
- Godot Web scene: https://mahasamutmateoj.github.io/game-development-lab1/lab01.html
- Demonstration video: https://mahasamutmateoj.github.io/game-development-lab1/demo.html

The repository contains the editable Godot scene and the exported Web build.
The video is a 1280 × 720 MP4 recording of the running scene.

## Open the project
Import `project.godot` in Godot 4.7 and press F6/F5.
The main editable scene is `scenes/Introduction.tscn`.

## Features
- Original SVG space background.
- Student portrait with transparent background.
- Controller, rocket and star sprites.
- Six-second AnimationPlayer loop for floating portrait and sprite motion.
- Pause/resume and replay buttons; Space and R keyboard shortcuts.
- Web release preset uses Compatibility renderer and disables threads.

## Web export
Install matching Godot 4.7 Web export templates, then export preset `Web`.
The generated main game file is `docs/lab01.html`; `docs/index.html` is the menu.
Serve the docs directory through HTTP/HTTPS to test. Opening the file directly
through file:// will not load WebAssembly resources correctly.

## Assets
See `asset_sources.md`. The portrait belongs to the student. Vector assets were
created for this assignment. See the bundled font license.
