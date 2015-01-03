require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "GET new" do
    it "renders the new form" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to employees page if user is admin" do
      set_super_user
      get :new
      expect(response).to redirect_to employees_path
    end
    it "redirects to welcome page if user is not admin" do
      set_current_user
      get :new
      expect(response).to redirect_to welcome_path
    end
  end

  describe "POST create" do

    context "with valid credentials" do

      let(:roy) { Fabricate(:employee) }
      let(:admin) { Fabricate(:super_user) }

      it "sets the sign in user in the session" do
        post :create, emp_id: roy.emp_id, password: roy.password
        expect(session[:emp_id]).to eq(roy.id)
      end
      it "redirects the signed in user to employees_path if super user" do
        post :create, emp_id: admin.emp_id, password: admin.password
        expect(response).to redirect_to employees_path
      end
      it "redirects the signed in user to the welcome_path if not super user" do
        post :create, emp_id: roy.emp_id, password: roy.password
        expect(response).to redirect_to welcome_path
      end
    end

    context "with invalid credentials" do

      let(:roy) { Fabricate(:employee) }

      before do
        post :create, emp_id: roy.emp_id, password: roy.password + "123"
      end

      it "does not set the user into the session" do
        expect(session[:emp_id]).to_not eq(roy.id)
      end
      it "sets the flash danger message" do
        expect(flash[:danger]).to eq("Invalid credentials.")
      end
      it "redirects to sign in page" do
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
