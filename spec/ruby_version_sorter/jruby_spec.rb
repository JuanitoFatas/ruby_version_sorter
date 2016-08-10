RSpec.describe RubyVersionSorter, "JRuby" do
  describe "#sort" do
    it "works for all JRuby versions as of 2016.08.09" do
      result = RubyVersionSorter.sort IO.read("spec/fixtures/jruby/versions.txt").split("\n").shuffle

      expect(result).to match_array(
        IO.read("spec/fixtures/jruby/sorted.txt").split("\n")
      )
    end

    it "works in the future" do
      result = RubyVersionSorter.sort(
        [
          "9.1.1.0",
          "9.1.2.0",
          "9.2.0.0.pre1", "9.2.0.0.rc1", "9.2.0.0",
          "9.2.1.0",
          "9.3.0.0.pre1", "9.3.0.0.pre2",
          "9.4.0.0"
        ].shuffle
      )

      expect(result).to match_array(
        [
          "9.1.1.0",
          "9.1.2.0",
          "9.2.0.0.pre1", "9.2.0.0.rc1", "9.2.0.0",
          "9.2.1.0",
          "9.3.0.0.pre1", "9.3.0.0.pre2",
          "9.4.0.0"
        ]
      )
    end
  end
end
