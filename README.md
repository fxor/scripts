# scripts

## remove docker image by name
```bash
function dockerrmi { docker rmi -f $(docker images | grep "$1" | awk '{ printf("%s\n", $3) }') }; dockerrmi postgres
```
