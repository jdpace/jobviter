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

  context "jobs_url" do
    it 'returns the full url for the job feed' do
      Jobviter.configure do |config|
        config.company_id = 'abcd1234'
      end

      expected_jobs_url = Jobviter.config.base_jobs_url + 'abcd1234'
      Jobviter.config.jobs_url.should == expected_jobs_url
    end

    it 'raises an error if the company_id is not configured' do
      Jobviter.configure do |config|
        config.company_id = nil
      end

      expect do
        Jobviter.config.jobs_url
      end.should raise_exception(Jobviter::Exception::InvalidConfiguration)
    end
  end

end
