module Jobviter
  class Config
    attr_accessor :base_jobs_url, :company_id

    def initialize
      self.base_jobs_url = "http://www.jobvite.com/CompanyJobs/Xml.aspx?c="
    end

    def jobs_url
      unless company_id
        raise Jobviter::Exception::InvalidConfiguration.new('company_id is required')
      end

      base_jobs_url + company_id
    end
  end

  class << self
    attr_accessor :config
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield(config)
  end
end

