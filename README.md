# chef-rundeck
A simple Sinatra app that presents matching node results of a Chef search formatted as a RunDeck resource list.

## Usage

Install the gem and fire up chef-rundeck.  Point it at a Chef client config file (a knife config would be ideal) using 
the `-c` flag and provide the URI for your Chef server's web UI.

## Configuration Notes

chef-rundeck binds to "localhost," which may result in it binding to an IPv6-only address in certain configurations.
If this isn't what you want, try starting chef-rundeck with the `-o` switch, e.g. `-o 0.0.0.0`.

You can use the `-u` switch to override the username that is inserted into a project as the remote user that Rundeck should use for execution.
The default is the system user that executes chef-rundeck, which may not be what you expect.

chef-rundeck now supports partial search against Enterprise Chef and OSS Chef servers running version 11 or greater!  
If your organization has many nodes and you notice slow performance from chef-rundeck, try turning it on with `--partial-search true`.

chef-rundeck caches the generated resource XML for a project by default for 30 seconds.  If this behavior ruins your day, change the number
of seconds a document is cached by using the `-t` switch.

Further configuration details can be found on the [wiki] (https://github.com/oswaldlabs/chef-rundeck/wiki/).

## Notes on Patches/Pull Requests

We want your cool additional feature.  Here's how to give it to us:

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it.  *THIS IS IMPORTANT* as it ensures no one else will break your feature accidentally somewhere down the line.
* If you're adding a feature, please also add documentation.
* *Exception:* Please don't change the Rakefile, version or history files!
* Commit your changes and push them to your GitHub repo.  Bonus points for committing your changes to a named topic branch ("awesome_new_feature" > "master")
* Send us a pull request through the GitHub UI.

# Copyright

Original code © 2010 Adam Jacob.  Released to the open source community under the Apache license in 2013.  See the LICENSE file for details.
