require_relative "spec_helper.rb"

describe ChromeRemoteDebug::Page do
  before do
    @page_spec = JSON.parse( IO.read("spec/fixtures/google_twitter_pages.txt"))[0]
  end

  describe "creation" do
    it "should be created with spec" do
      expect { ChromeRemoteDebug::Page.new(@page_spec) }.not_to raise_error
    end
  end

  describe "attributes" do
    before do
      @page = ChromeRemoteDebug::Page.new(@page_spec)
    end

    it "should have an url attribute" do
      expect(@page.url).to eq(@page_spec["url"])
    end

    it "should have a favicon attribute" do
      expect(@page.favicon).to eq(@page_spec["faviconUrl"])
    end

    it "should have a title attribute" do
      expect(@page.title).to eq(@page_spec["title"])
    end
  end

  describe "reload" do
    before do
      @page = ChromeRemoteDebug::Page.new(@page_spec)
      @websocket = double()
      @websocket.stub(:send)
      @websocket.stub(:close)
    end

    it "should connect to page websocket" do
      WebSocket.should_receive(:new).with(@page_spec["webSocketDebuggerUrl"]).and_return(@websocket)
      @page.reload
    end

    it "should send a reload command" do
      WebSocket.stub(:new => @websocket)
      @websocket.should_receive(:send).with(/reload/)
      @page.reload
    end

    it "should disconnect" do
      WebSocket.stub(:new => @websocket)
      @websocket.should_receive(:send)
      @websocket.should_receive(:close)
      @page.reload
    end
  end

  # TODO: remove duplication
  describe "navigate" do
    before do
      @page = ChromeRemoteDebug::Page.new(@page_spec)
      @websocket = double()
      @websocket.stub(:send)
      @websocket.stub(:close)
      @url = "http://www.google.com"
    end

    it "should connect to page websocket" do
      WebSocket.should_receive(:new).with(@page_spec["webSocketDebuggerUrl"]).and_return(@websocket)
      @page.navigate(@url)
    end

    it "should send a navigate command" do
      WebSocket.stub(:new => @websocket)
      @websocket.should_receive(:send).with(/navigate/).with(/#{@url}/)
      @page.navigate(@url)
    end

    it "should disconnect" do
      WebSocket.stub(:new => @websocket)
      @websocket.should_receive(:send)
      @websocket.should_receive(:close)
      @page.navigate(@url)
    end
  end

end
