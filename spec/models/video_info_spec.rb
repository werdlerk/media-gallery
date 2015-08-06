require "rails_helper"

describe VideoInfo do
  context "relations" do
    it { should have_one(:media) }
  end
end