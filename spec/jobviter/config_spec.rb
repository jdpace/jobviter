require 'spec_helper'

describe Jobviter::Config do

  context "#configure" do
    it "saves config values" do
      Jobviter.configure do |config|
        config.company_id = 'abcd1234'
      end

      Jobviter.config.company_id.should == 'abcd1234'
    end

    it "has default values" do
      Jobviter.config.base_jobs_url.should == "http://www.jobvite.com/CompanyJobs/Xml.aspx?c="
    end
  end

end
