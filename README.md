# dotfiles

> Useful cross-platforms (Linux and Windows) commands, aliases and configurations for Bash and Powershell managed by [chezmoi](https://www.chezmoi.io).

## Requirements

You must install chezmoi on your system.

### Linux

Use your favorite package manager or perform a manual installation described on [chezmoi](https://www.chezmoi.io) documentation.

```sh
brew install chezmoi

# Please change your username
chezmoi init --apply renebentes
```

### Windows

You can use the new winget tool for this. Please, read the official documentation for further details.

```porwershell
# Change the PowerShell policy execution
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

winget install twpayne.chezmoi

# Please change your username
chezmoi init --apply renebentes
```

## Goals

- Unified aliases and commands;
- Same shell interface.

## Author

[Rene Bentes Pinto](http://github.com/renebentes)

## Contributing

Have a look through existing [Issues](http://github.com/renebentes/repository/issues) and [Pull Requests](http://github.com/renebentes/repository/pulls) that you could help with.

Your contributions are welcome. Feel free to send issues or pull requests.

## Release Notes

You can [see the release notes here](CHANGELOG.md)

## License

Copyright (c) 2024 Rene Bentes Pinto

This project licensed under **MIT** terms. See the [LICENSE](LICENSE) file for details.
