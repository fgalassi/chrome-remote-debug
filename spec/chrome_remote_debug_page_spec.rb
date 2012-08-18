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

end
