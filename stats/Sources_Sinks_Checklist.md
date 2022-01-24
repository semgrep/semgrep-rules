# Sources and Sinks Checklist

## Language-specific

### Sources
* [ ] Network read
* [ ] File read
* [ ] Environment variables
* [ ] STDIN

### Sinks
* [ ] Network send    # stdlib and 1-3 most popular third party libraries
* [ ] File write
* [ ] Shell commands - stdlib and 1-3 most popular third party libraries
* [ ] Code injection  - `eval` and the like
* [ ] STDOUT

## Web Framework-specific

### Sources

* [ ] URL parameters
* [ ] POST body parameters
* [ ] Cookies
* [ ] Headers