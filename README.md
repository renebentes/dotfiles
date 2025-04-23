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

Contributions are welcome!

Have a look through existing [Issues][issues] and [Pull Requests][pulls] that you could help with.

If you find any issues or have suggestions for improvements, please open an [_Issue_][issues] or submit a [_Pull Request (PR)_][pulls] to our [repository][repo].

You can also check existing _Issues_ and _Pull Requests_ that you could help with.

When contributing to this project, please follow the existing code style, use [conventional commits][commits], and submit your changes in a separate branch.

## Release Notes

You can [see the release notes here][changelog]

## License

Copyright (c) 2024 Rene Bentes Pinto

This project licensed under **MIT** terms. See the [LICENSE](LICENSE) file for details.

[repo]: http://github.com/renebentes/repository
[issues]: ../../issues
[pulls]: ../../pulls
[changelog]: ../../commits
[commits]: https://www.conventionalcommits.org/en/v1.0.0/
