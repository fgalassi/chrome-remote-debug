require_relative "spec_helper.rb"

describe ChromeRemoteDebug::Command do

  describe "creation" do
    it "should created with method" do
      expect {
        ChromeRemoteDebug::Command.new(
          "method"
        )
      }.not_to raise_error
    end

    it "should be created with method and params" do
      expect {
        ChromeRemoteDebug::Command.new(
          "method", :param1 => "1", :params2 => "2"
        )
      }.not_to raise_error
    end
  end

  describe "id" do
    before do
      ChromeRemoteDebug::Command.class_variable_set :@@id, 1
      @command = ChromeRemoteDebug::Command.new(
        "method", :param1 => "1", :param2 => "2"
      )
    end

    it "should start at 1" do
      expect(@command.id).to eq(1)
    end

    it "should increase monotonically" do
      command2 = ChromeRemoteDebug::Command.new("method")
      command3 = ChromeRemoteDebug::Command.new("method")
      expect(command2.id).to eq(2)
      expect(command3.id).to eq(3)
    end
  end

  describe "serialization" do
    before do
      ChromeRemoteDebug::Command.class_variable_set :@@id, 1
    end

    it "should be serializable to json" do
      command = ChromeRemoteDebug::Command.new(
        "method", :param1 => "1", :param2 => "2"
      )
      expect(command.to_json).to eq(
        JSON.generate({
          "id" => 1,
          "method" => "method",
          "params" => {
            "param1" => "1",
            "param2" => "2"
          }
        })
    )
    end

    it "should consider params optional" do
      command = ChromeRemoteDebug::Command.new("method")
      expect(command.to_json).to eq(
        JSON.generate({ "id" => 1, "method" => "method", "params" => {} })
    )
    end
  end

end
