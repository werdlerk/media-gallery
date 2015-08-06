require "rails_helper"

describe AudioInfo do
  context "relations" do
    it { should have_one(:media) }
  end
end