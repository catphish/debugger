# Failer

This is a simple rack application which can be used to help test various
failures in Viaduct. By default, it will work perfectly but depending
on the value in the `FAILURE` environment variable it will respond differently.

The various options available are:

* `build` - the build command will fail to execute with an exit code 1
* `run` - the web server will not start at all
* `request` - all requests will return a 500 error
* `die-after-xx` - the server will die after xx seconds of running
* `slow-start` - the web server will take 15 seconds to start
