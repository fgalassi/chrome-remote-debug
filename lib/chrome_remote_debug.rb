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

  class Page
    def initialize(spec)
      @spec = spec
    end

    def url
      @spec["url"]
    end

    def favicon
      @spec["faviconUrl"]
    end

    def title
      @spec["title"]
    end
  end
end

