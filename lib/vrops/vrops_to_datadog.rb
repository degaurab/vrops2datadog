require 'dogapi'


module Vrops
  class VropsToDatadog
    def initialize(logger:nil)
      @logger = logger || Logger.new($stdout)
      @config = Vrops::Configuration.new(logger)
      @vrop_host_config = @config.get_vrop_host_config
    end

    attr_reader :logger, :config, :vrop_host_config


    def start_monitoring
      #to-do entry point for monitoring from scheduler
    end

    def get_resource_identifier(resource_key)
      #to-do get identifier from the json
      # url: suite-api/api/adapterkinds/EMC/resources
    end

    def get_resource_from_adapter(adapter_kind_key)

    end

    def load_resources
      config.get_resources
    end



    def vrops_request(endpoints)
      response =  HTTParty.get(
        "https://www.#{vrop_hostname}/suite-api/api/#{endpoint}",
        headers: { :basic_auth => config.tracker_token, 'Content-Type' => 'application/json'}
      )
      if response.success?
        logger.debug("URL: #{endpoints}, Success... status_code: #{response.code}")
      else
        logger.error("URL: #{endpoints}, Failure!!! status_code: #{response.code}")
      end
      response
    end
  end
end
