# cli-chatgpt

A Swift CLI application to ask ChatGPT anything directly from the terminal.

## Installation

You can install the app `directly from Github`.

## Manually

A new Github release is created each time a new version is available. You can download the latest version of the executable directly from the [releases page](https://github.com/henriquestiagoo/cli-chatgpt/releases).

After getting the binary file, you can create a symlink to the executable for easy access.

```bash
chmod +x chatgpt && sudo mv chatgpt /usr/local/bin/
```

## Usage

The application communicates with the [OpenAI API](https://platform.openai.com/docs/api-reference) to make use of the ChatGPT AI model. Note you must have an API key (either free or pay-as-you-go) to make requests to the API. You can check your available API Keys [here](https://platform.openai.com/account/api-keys). 

```bash
chatgpt <message to be interpreted by the OpenAI model> --apikey <api-key>
```

## Uninstallation

If for any reason you wish to uninstall the ChatGPT CLI application from your system, you can do so by removing the binary:

```bash
sudo rm /usr/local/bin/chatgpt
```

## Reporting Issues and Contributing

If you encounter any issues or have suggestions for improvements, I encourage you to [submit an issue](https://github.com/henriquestiagoo/cli-chatgpt/issues/new) on GitHub. Any  feedback or contribution to help make this application better are welcome 🙂
