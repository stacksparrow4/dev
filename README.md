This is my dev container for developing stuff consistently across environments.

1. [Install the "Dev Containers" VSCode extension.](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
1. You will need a folder with the stuff you are working in. Open that folder in VScode.
1. Open the integrated terminal and run
    ```bash
    mkdir .devcontainer
    wget -O .devcontainer/devcontainer.json TODO
    ```
1. Open VScode command palette (CTRL-SHIFT-P) and type in "Dev containers: Rebuild and reopen in container" and select the option.