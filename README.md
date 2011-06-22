Jobviter
========

Jobviter is a simple Ruby gem which fetches and parses a given company's
jobvite.com listing feed.


Installation
------------

    $ gem install jobviter


Dependencies
------------

Jobviter uses [Typhoeus](https://github.com/dbalatero/typhoeus) to fetch
and [Nokogiri](https://github.com/tenderlove/nokogiri) to parse the job
feed. They each have their own dependencies like libcurl and libxml2.
Installation instructions are given on their respective sites.


Usage
-----

Below is an example of using Jobviter to pull down a list of Twitter
job listings.

    ruby > require 'jobviter'
    ruby > Jobviter.configure do |config|
    ruby >   config.company_id = 'q8X9VfwT'
    ruby > end
    ruby > jobs = Jobviter::Job.all
     => 71
    ruby > job = jobs.first
     => #<Jobviter::Job:0x00000100a85600>
    ruby > job.title
     => "Software Engineer - Tools"
    ruby > job.apply_url
     => "http://hire.jobvite.com/CompanyJobs/Apply.aspx?c=q8X9VfwT&j=oSbdVfwV"


Contributing
------------

* Fork the project.
* Setup your development environment with: gem install bundler; bundle install
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.


Copyright
---------

Copyright (c) 2011 Jared Pace. See LICENSE for details.
