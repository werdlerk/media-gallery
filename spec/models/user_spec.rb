require "rails_helper"

describe User do
  context "relations" do
    it { should have_many(:media) }
    it { should have_many(:comments)}
    it { should have_secure_password }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end

  context "methods" do

  end
end