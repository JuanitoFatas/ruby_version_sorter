require "spec_helper"

RSpec.describe RubyVersionSorter do
  it "has a version number" do
    expect(RubyVersionSorter::VERSION).not_to be nil
  end
end
