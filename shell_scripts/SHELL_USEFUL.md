# Some Quick and Useful Shell Commands

<br>


## Downloading all pdfs of url

```shell
$ wget --recursive --level=2 --no-directories --no-host-directories --accept pdf
```

<br>

## Extended attributes of files

```shell
$ xattr -l $file
```

<br>

## Check signatures of Apps

<br>

```shell
$ codesign -dvvv $file.app
```

<br>

## Show all the configs

<br>

```shell
$ system_profiler -detaillevel full
```

<br>

## 瑪麗


<br>


```shell
$ convert -size 360x360 xc:white -font "FreeMono" -pointsize 12 -fill black -draw @ascii.txt
```
