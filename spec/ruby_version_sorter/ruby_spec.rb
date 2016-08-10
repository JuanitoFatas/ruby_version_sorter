RSpec.describe RubyVersionSorter, "Ruby" do
  describe "#sort" do
    it "works for all Ruby versions as of 2016.08.09" do
      result = RubyVersionSorter.sort IO.read("spec/fixtures/ruby/versions.txt").split("\n").shuffle

      expect(result).to match_array(
        IO.read("spec/fixtures/ruby/sorted.txt").split("\n")
      )
    end

    it "works in the future" do
      result = RubyVersionSorter.sort(
        [
          "2.4.0-preview1", "2.4.0-rc1", "2.4.0",
          "2.5.0", "2.6.0",
          "2.7.0-preview1", "2.7.0-rc1", "2.7.0",
          "2.8.0-preview1", "2.8.0-rc1", "2.8.0",
          "2.9.0", "2.9.1", "2.9.2", "2.9.3", "2.9.4", "2.9.5",
          "2.9.6", "2.9.7", "2.9.8", "2.9.9", "2.9.10", "2.9.11", "2.9.12",
          "3.0.0-preview1", "3.0.0-rc1", "3.0.0-rc2", "3.0.0-rc3", "3.0.0"
        ].shuffle
      )

      expect(result).to match_array(
        [
          "2.4.0-preview1", "2.4.0-rc1", "2.4.0",
          "2.5.0", "2.6.0",
          "2.7.0-preview1", "2.7.0-rc1", "2.7.0",
          "2.8.0-preview1", "2.8.0-rc1", "2.8.0",
          "2.9.0", "2.9.1", "2.9.2", "2.9.3", "2.9.4", "2.9.5",
          "2.9.6", "2.9.7", "2.9.8", "2.9.9", "2.9.10", "2.9.11", "2.9.12",
          "3.0.0-preview1", "3.0.0-rc1", "3.0.0-rc2", "3.0.0-rc3", "3.0.0"
        ]
      )
    end
  end
end
