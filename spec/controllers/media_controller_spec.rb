require "rails_helper"

describe MediaController do

  describe "GET #index" do

    it "sets the @media variable" do
      media = Media.create!

      get :index

      expect(assigns(:media)).to match_array( [ media ] )
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template :index
    end
  end
end