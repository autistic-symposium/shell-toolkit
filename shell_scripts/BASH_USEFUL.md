* Downloading all pdfs of url

$ wget --recursive --level=2 --no-directories --no-host-directories --accept pdf


* Extended attributes of files
$ xattr -l $file


* Check signatures of Apps
$ codesign -dvvv $file.app


* Show all the configs
$ system_profiler -detaillevel full