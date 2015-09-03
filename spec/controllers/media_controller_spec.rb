require "rails_helper"

describe MediaController do
  let(:user) { FactoryGirl.create(:user) }
  let(:media) { FactoryGirl.create(:media, user: user) }

  describe "GET #index" do
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
    context "authenticated users" do
      before do
        sign_in
        get :new
      end

      it "sets the @media variable" do
        expect(assigns(:media)).not_to be_persisted
      end

      it "renders the new media form" do
        expect(response).to render_template :new
      end
    end

    context "unauthenticated users" do
      before { get :new }

      it "redirects to the root" do
        expect(response).to redirect_to root_path
      end

      it "sets the flash message" do
        expect(flash[:danger]).to be_present
      end
    end
  end

  describe "POST #create" do
    let(:media_attributes) { FactoryGirl.attributes_for(:media) }

    context "authenticated users" do
      before { sign_in }

      context "valid input" do
        before { post :create, media: media_attributes }

        it "sets the flash message" do
          expect(flash[:success]).to be_present
        end

        it "redirect to the media index" do
          expect(response).to redirect_to media_index_path
        end
      end

      context "invalid input" do
        before { post :create, media: { url: nil } }

        it "sets the media variable" do
          expect(assigns(:media)).to be_a_new(Media)
        end

        it "sets the validation errors" do
          expect(assigns(:media).errors).not_to be_empty
        end

        it "renders the new template" do
          expect(response).to render_template :new
        end
      end
    end

    context "unauthenticated users" do
      before { post :create }

      it "redirects to the root" do
        expect(response).to redirect_to root_path
      end

      it "sets the flash message" do
        expect(flash[:danger]).to be_present
      end
    end
  end
end