require "rails_helper"

RSpec.describe EmployeesController, :type => :controller do
  describe "GET #search" do
    it "sets the @results instance variable" do
      jane = Fabricate(:employee, emp_id: "emp_1", first_name: "Jane", last_name: "Smith", other_names: "Abena")
      session[:emp_id] = jane.id
      get :search, q: "Jane Abena Smith"
      expect(assigns(:results)).to eq([jane])
    end
    it "redirects to employee show page when @results contains 1 employee" do
      jane = Fabricate(:employee, emp_id: "emp_1", first_name: "Jane", last_name: "Smith", other_names: "Abena")
      session[:emp_id] = jane.id
      get :search, q: "Jane Abena Smith"
      expect(response).to redirect_to jane
    end
  end

  describe "GET #index" do
    it "redirects to welcome_path if user is not a super user" do
      set_current_user
      get :index
      expect(response).to redirect_to welcome_path
    end
    it "renders the index template if user is super user" do
      set_super_user
      get :index
      expect(response).to render_template :index
    end
  end
end
