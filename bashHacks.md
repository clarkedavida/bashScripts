# Useful Bash constructions

There are a bunch of tasks I have commonly need to do with Bash,
but I have difficulty remembering the exact syntax for them. These
tasks do not always lend themselves well to bash functions.

## Recursively find and replace in files
```shell
find . -type f -name "*.txt" -print0 | xargs -0 sed -i '' -e 's/foo/bar/g'
```

## Get everything in string X after marker Y
```shell
${X##*Y}
```

## Get everything in string X before marker Y
```shell
${X%%Y*}
```

## Get first 2 characters of X
```shell
${X:0:2}
```

## Delimiter m, take 2nd entry of Y, store in X
```shell
X=$(echo $Y | cut -dm -f2)
```

## Pad number Y with zeros until length N, store in X
```shell
X=$(printf "%0Nd" X)
```

## Sequence
```shell
thing=$(seq 1 512)
```

## Sort table on 1st then 2nd columns
```shell
sort -k1,2 table > temp
mv temp table
```

## Add text to end of line that begins with PYTHONPATH
```shell 
sed -ie 's/^PYTHONPATH*$/& ADDing MORE TEXT TO THE END/g' file
```
