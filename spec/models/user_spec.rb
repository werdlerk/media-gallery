require "rails_helper"

describe User do
  context "relations" do
    it { should have_many(:media) }
    it { should have_many(:comments)}
  end

  context "validations" do

  end

  context "methods" do

  end
end