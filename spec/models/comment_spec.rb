require "rails_helper"

describe Comment do
  context "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:commentable) }
  end

  context "validations" do
    
  end

  context "methods" do
    
  end
end