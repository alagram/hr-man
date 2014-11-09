require "rails_helper"

RSpec.describe EmployeesController, :type => :controller do
  describe "GET #search" do
    it "sets the @results instance variable" do
      jane = Fabricate(:employee, emp_id: "emp_1", first_name: "Jane", last_name: "Smith", other_names: "Abena")
      get :search, q: "Jane Abena Smith"
      expect(assigns(:results)).to eq([jane])
    end
  end
end
