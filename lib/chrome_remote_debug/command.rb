require "json"

module ChromeRemoteDebug
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
