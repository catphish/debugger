# Viaduct Debugger

This is a simple application which can be used to help test various
failures in Viaduct. By default, it will work perfectly but depending
on the value in the `MODE` environment variable it will respond differently.

The various options available are:

* `fail-on-build` - the build command will fail to execute with an exit code 1
* `fail-on-run` - the web server will not start at all
* `fail-on-request` - all requests will return a 500 error
* `die-after-xx` - the server will die after xx seconds of running
* `slow-start` - the web server will take 15 seconds to start
* `constant-log` - outputs log entries at least once every 12 seconds
* `fast-log` - outputs log entries at least once every 2 seconds
* `very-fast-log` - outputs log entries at least once every 0.3 seconds

You can also request streamed data by requesting `/stream` in a client
which supports streaming data (i.e. curl).

## HTTP methods

* `/` - just returns some text
* `/stream` - streams some data
* `/request-id` - returns the current X-Request-ID
* `/sendfile/images/pic1.jpg` - should return an image from the images folder
  using the X-Viaduct-Send-File header.

## Another Web Server

There is another web server waiting to do stuff! Just start it up

```
rackup other.ru
```
