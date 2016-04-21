require 'yaml'
require 'logger'

module Vrops
  class Configuration
    def initialize(logger=nil)
      @config = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yml')))
      @logger = logger || Logger.new($stdout)
    end

    attr_reader :logger, :config

    def update
      @config = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yml')))
    end

    def get_adapterkind_keys
      config.fetch('adapterKindKey')
    end

    def get_resources
      config.fetch('resources')
    end

    def get_vrop_host_config
      vrop_auth = config.fetch('vrops_auth')
    end
  end
end
