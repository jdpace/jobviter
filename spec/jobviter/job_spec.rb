require 'spec_helper'

describe Jobviter::Job do

  context "fetching trouble makers" do
    before do
      jobs_xml = SpecRoot.join('fixtures', 'jobs.xml').read
      Jobviter::Job.stubs(:fetch).returns(jobs_xml)
    end

    context '#all' do
      it 'should return all of the jobs' do
        jobs = Jobviter::Job.all

        jobs.count.should == 3
        jobs[0].title.should == "Senior Trouble Maker"
        jobs[1].title.should == "Lead Shenanigan Engineer"
        jobs[2].title.should == "Executive LOL Cat Photographer"
      end
    end

    context '#first' do
      it 'returns the first job found if given no arguments' do
        job = Jobviter::Job.first
        job.title.should == "Senior Trouble Maker"
      end

      it 'returns the first n items if given a limit' do
        jobs = Jobviter::Job.first(2)
        jobs.count.should == 2
        jobs[0].title.should == "Senior Trouble Maker"
        jobs[1].title.should == "Lead Shenanigan Engineer"
      end
    end

    context '#find' do
      it 'returns a job by its id' do
        job = Jobviter::Job.find 'roflcptr'
        job.should_not be_nil
        job.title.should == "Lead Shenanigan Engineer"
      end
    end

    context 'being parsed' do
      it 'assigns its attributes appropriately' do
        photographer = Jobviter::Job.find 'lolcat99'

        photographer.id.should == 'lolcat99'
        photographer.title.should == 'Executive LOL Cat Photographer'
        photographer.requisition_id.should == 'req3'
        photographer.category.should == 'LOL Cats'
        photographer.job_type.should == 'Part-Time'
        photographer.location.should == 'Washington, DC'
        photographer.date.should == Date.parse('July, 1st 2011')
        photographer.detail_url.should == 'http://hire.jobvite.com/CompanyJobs/Job.aspx?c=funcorp1&j=lolcat99'
        photographer.apply_url.should == 'http://hire.jobvite.com/CompanyJobs/Apply.aspx?c=funcorp1&j=lolcat99'
        photographer.description.should == "Is your favorite day <strong>Caturday</strong>? Then we want to hear from you!"
        photographer.brief_description.should == "Ceiling cat is watching you apply for jobs"
      end
    end
  end

  context 'error handling' do
    before do
      Jobviter.configure {|c| c.company_id = 'corp1234'}
    end

    it 'raises an error if unsuccessful response is returned' do
      bad_response = stub 'response', :success? => false, :code => 500
      Typhoeus::Request.expects(:get).returns(bad_response)

      expect do
        Jobviter::Job.all
      end.should raise_exception(Jobviter::Exception::BadResponse)
    end
  end

end
