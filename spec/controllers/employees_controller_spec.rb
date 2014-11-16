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
end
