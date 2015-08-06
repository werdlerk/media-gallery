require "rails_helper"

describe Media do
  context "relations" do
    it { should belong_to :user }
    it { should belong_to :media_info }
  end

  context "validations" do

  end

  context "methods" do

  end
end