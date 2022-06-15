cd ~/builds
GOOS=linux go build -o ~/builds/overpassLinux ~/src/overpass.go
GOOS=windows go build -o ~/builds/overpassWindows.exe ~/src/overpass.go
GOOS=darwin go build -o ~/builds/overpassMacOS ~/src/overpass.go
GOOS=freebsd go build -o ~/builds/overpassFreeBSD ~/src/overpass.go
GOOS=openbsd go build -o ~/builds/overpassOpenBSD ~/src/overpass.go