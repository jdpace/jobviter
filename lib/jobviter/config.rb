module Jobviter
  class Config
    attr_accessor :base_jobs_url, :company_id

    def initialize
      self.base_jobs_url = "http://www.jobvite.com/CompanyJobs/Xml.aspx?c="
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

