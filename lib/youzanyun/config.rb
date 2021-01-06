module Youzanyun

  class << self
    attr_accessor :config

    def configure
      yield self.config ||= Config.new
    end

    def youzanyun_redis
      return nil if config.nil?
      @redis ||= config.redis
    end

    def key_expired
      config.key_expired rescue 100
    end

    def rest_client_options
      return { timeout: 5, open_timeout: 5, verify_ssl: true } if config.nil?
      config.rest_client_options
    end
  end

  class Config
    attr_accessor :redis, :rest_client_options, :key_expired
  end
end
