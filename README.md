# gg2

Formula for <https://github.com/peterbe/gg2>

##

## How do I install these formulae?

```bash
brew tap peterbe/gg2
brew install gg2
```

and test

```bash
gg2 --version
gg2 --help
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Notes

I created this repo with:

```bash
brew tap-new peterbe/homebrew-gg2
```

I created the initial formula with

```bash
brew create https://github.com/peterbe/gg2/archive/refs/tags/v0.0.13.tar.gz --tap peterbe/homebrew-gg2 --set-name gg2 --ruby
```

To iteratively install and re-install, I run:

```bash
brew install --verbose gg2
```