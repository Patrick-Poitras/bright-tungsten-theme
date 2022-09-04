A port of the VSCode Community Material themes. 

The current collection is still a work in progress, and I've only tested the themes with my personal workflow. Please let me know if an element appears to have a clashing color associated to it, since I have to manually add faces in the `global-configuration.txt` file for them to work.

I'm planning to port all of the community material themes, but for now am only doing the one I like the most (Ocean).

# Installation

Prerequisite is `autothemer`. Install it from MELPA with `M-x package-refresh-contents RET` then `M-x package-install RET autothemer`.

Since these themes are still in development, they are not yet available on MELPA. As such the configuration has a few extra steps.

First, clone the git repo. Alternatively, download the zip file by going to the top of this page and selecting "Download zip" from the "Code" dropdown menu, and extract the contents.

You then need to add the folder to `custom-themes-load-path`. This can be done by adding the following line to your `.emacs` file.

```
(push "/path/to/directory/folder/emacs-material-ocean/" custom-theme-load-path)
```

Then, right below that, add the following line to load the theme.
```
(load-theme 'material-ocean t)
```

See the original pallettes [here](https://github.com/material-theme/vsc-material-theme/blob/a0079e8d0cc8711cd81d410827fcc16bcb1f9e6b/scripts/generator/settings/specific/ocean-hc.ts)

It's made with autothemer.

# Further comments
- The build/generate system is certified Janky®. It copy-pastes a bunch of code into another file. Predictably, it became a monstrosity the minute the copy-pasting code was written. Just modify the end result files provided if you need to modify it, or if you want to use it as an example, don't.
