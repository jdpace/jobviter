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

Below is an example of using Jobviter to pull down a list of TiVo
job listings.

    ruby > require 'jobviter'
    ruby > Jobviter.configure do |config|
    ruby >   config.company_id = 'q1h9Vfw6'
    ruby > end
    ruby > jobs = Jobviter::Job.all
     => 71
    ruby > job = jobs.first
     => #<Jobviter::Job:0x00000100a85600>
    ruby > job.title
     => "Sr. Supervisor"
    ruby > job.apply_url
     => "http://app.jobvite.com/CompanyJobs/Careers.aspx?c=q1h9Vfw6&j=obuW5fwq&k=Apply"


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
