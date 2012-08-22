require "net/http"
require "json"

module ChromeRemoteDebug
  class Client
    def initialize(host, port)
      @host = host
      @port = port
    end

    def pages
      json = Net::HTTP.get(@host, "/json", @port)
      JSON.parse(json).map {|page_spec| Page.new(page_spec)}
    end
  end
end
