require "rails_helper"

RSpec.describe NextOfKinsController, :type => :controller do
  describe "GEt #new" do
    it "redirects to employees show page if NextOfKin percentage is 100" do
      employee = Fabricate(:employee)
      next_of_kin = Fabricate(:next_of_kin, percentage: 100, employee_id: employee.id)
      get :new, employee_id: employee.id
      expect(response).to redirect_to employee
    end
    it "sets flash message if NextOfKin percentage is 100" do
      employee = Fabricate(:employee)
      next_of_kin = Fabricate(:next_of_kin, percentage: 100, employee_id: employee.id)
      get :new, employee_id: employee.id
      expect(flash[:danger]).to be_present
    end
    it "it new template if NextOfKin percentage is not 100" do
      employee = Fabricate(:employee)
      next_of_kin = Fabricate(:next_of_kin, percentage: 50, employee_id: employee.id)
      get :new, employee_id: employee.id
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    let(:employee) { Fabricate(:employee) }
    context "with valid details" do

      before do
        post :create, next_of_kin: Fabricate.attributes_for(:next_of_kin, percentage: 20), employee_id: employee.id
      end
      it "redirects to employee show page" do
        expect(response).to redirect_to employee
      end
      it "creates a next of kin contact" do
        expect(NextOfKin.count).to eq(1)
      end
      it "associates the employee's emp_id to the next of kin contact" do
        expect(NextOfKin.first.employee).to eq(employee)
      end
      it "creates flash success message" do
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid details" do
      it "does not create a next of kin contact" do
        post :create, next_of_kin: { other_names: "Adjei" }, employee_id: employee.id
        expect(NextOfKin.count).to eq(0)
      end
      it "renders new template" do
        post :create, next_of_kin: { other_names: "Adjei" }, employee_id: employee.id
        expect(response).to render_template :new
      end
    end
  end
end
