require_relative "spec_helper.rb"

describe ChromeRemoteDebug::Client do

  describe "creation" do
    it "should be created with host and port" do
      expect { ChromeRemoteDebug::Client.new("127.0.0.1", 9222) }.not_to raise_error
    end
  end

  describe "pages" do
    before do
      stub_request(:get, "127.0.0.1:9222/json").to_return({
        :body => File.new("spec/fixtures/google_twitter_pages.txt")
      })
      @chrome = ChromeRemoteDebug::Client.new("127.0.0.1", 9222)
      @pages = @chrome.pages
    end

    it "should list all of them" do
      expect(@pages.count).to eq(2)
    end

    it "should return pages" do
      @pages.all? {|page| expect(page).to be_instance_of(ChromeRemoteDebug::Page)}
    end

    it "should return google and twitter pages" do
      expect(@pages[0].url).to match(/google/)
      expect(@pages[1].url).to match(/twitter/)
    end
  end

end
