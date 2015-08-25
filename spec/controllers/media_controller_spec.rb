require "rails_helper"

describe MediaController do

  describe "GET #index" do
    let(:user) { FactoryGirl.create(:user) }
    let(:media) { FactoryGirl.create(:media, user: user) }

    it "sets the @media variable" do
      get :index

      expect(assigns(:media)).to match_array( [ media ] )
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template :index
    end
  end

  describe "GET #new" do

    it "sets the @media variable" do
      get :new

      expect(assigns(:media)).not_to be_persisted
    end

    it "renders the new media form" do
      get :new

      expect(response).to render_template :new
    end
  end
end