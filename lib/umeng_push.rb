require "umeng_push/version"
require "umeng_push/configuration"
require 'umeng_push/response_error'
require "umeng_push/client"

module UmengPush
  HOST = "http://msg.umeng.com"

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
