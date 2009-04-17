# GemCollector: simple installation and activation

[RubyGems](http://rubygems.org/) provides mechanism for declaring dependencies on gems, e.g.

    gem "rspec", "1.1.12"
    gem "rcov", ">= 0.8.1"
    gem "capistrano"

GemCollector leverages this existing DSL for installation of gems.  

## Using it

Assuming you have all your "gem" commands in a file, running

    require 'gem_collector'
    GemCollector.load("file_containing_gem_requirements.rb") 

will install any missing gems.

## Disclaimer

GemCollector does not:

* feed starving orphans
* do laundry
