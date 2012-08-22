require "net/http"
require "json"
require_relative "../vendor/web-socket-ruby/lib/web_socket"

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

    def reload
      ws = ::WebSocket.new(@spec["webSocketDebuggerUrl"])
      ws.send(JSON.generate(Command.new("Page.reload")))
      ws.close()
    end
  end

  class Command
    @@id = 1

    def initialize(method, params = {})
      @method = method
      @params = params
      @id = @@id
      @@id += 1
    end

    def id
      @id
    end

    def to_json(*a)
      { "id" => id, "method" => @method, "params" => @params }.to_json(*a)
    end
  end

end
