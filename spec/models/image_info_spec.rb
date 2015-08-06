require "rails_helper"

describe ImageInfo do
  context "relations" do
    it { should have_one(:media) }
  end
end