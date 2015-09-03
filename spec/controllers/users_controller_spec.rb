require "rails_helper"

describe UsersController do

  describe "GET #new" do

    context "unauthenticated users" do
      it "renders the template" do
        get :new

        expect(response).to render_template :new
      end

      it "builds the user variable" do
        get :new

        expect(assigns(:user)).to be_a_new User
      end
    end

    context "authenticated users" do
      it "redirects to the root" do
        sign_in

        get :new

        expect(response).to redirect_to root_path
      end
    end
  end

  describe "POST #create" do
    context "unauthenticated users" do
      context "with valid input" do
        before do
          post :create, user: FactoryGirl.attributes_for(:user)
        end

        it 'should create the user' do
          expect(assigns(:user)).to be_persisted
          expect(User.count).to eq(1)
        end

        it 'should redirect to the login page with the flash message' do
          expect(response).to redirect_to login_path
        end
      end

      context "with invalid input" do
        before do
          post :create, { user: { name: 'Koen' } }
        end

        it 'does not create the user' do
          expect(User.count).to eq(0)
        end

        it 'should render the new page for form errors' do
          expect(response).to render_template 'new'
        end

        it 'sets the @user variable' do
          expect(assigns(:user)).to be_a_new(User)
        end
      end
    end

    context "authenticated users" do
      it "redirects to the root" do
        sign_in

        post :create, user: FactoryGirl.attributes_for(:user)

        expect(response).to redirect_to root_path
      end
    end
  end
end