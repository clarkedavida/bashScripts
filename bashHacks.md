# Useful Bash constructions

There are a bunch of tasks I have commonly need to do with Bash,
but I have difficulty remembering the exact syntax for them. These
tasks don't always lend themselves well to bash functions.

## Recursively find and replace in files
```shell
find . -type f -name "*.txt" -print0 | xargs -0 sed -i '' -e 's/foo/bar/g'
```

## Get everything in string X after marker Y
```shell
${X##*Y}
```

## get everything in string X before marker Y
```shell
${X%%Y*}
```

