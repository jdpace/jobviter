module Jobviter
  module Exception

    class BadResponse < StandardError
      def initialize(message)
        super "Error Fetching Data from Jobvite: #{message}"
      end
    end

    class InvalidConfiguration < StandardError
      def initialize(message)
        super "Invalid Configuration: #{message}"
      end
    end

  end
end
