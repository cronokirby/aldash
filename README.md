# Aldash

A dashboard to use with the alchemy discord library

## Building
TL;DR download half the internet.

You'll need to download [Elm](https://guide.elm-lang.org/install.html),
as well as the [Haskell Platform](http://www.haskell.org/platform).
Then you'll need to install Clay, which should be as easy
as `cabal update & cabal install clay`

After cloning the repo, run the following from the base directory
```
cd elm & elm-make src/Main.elm  --output=../build/index.js &
cd ../style & runghc style.hs
```

## Using in an actual project
It's best to clone the repo, build things, and then use it
as a local dependancy in mix.
