require "rails_helper"

RSpec.describe NextOfKinsController, :type => :controller do
  describe "POST #create" do
    let(:sam) { Fabricate(:employee, emp_id: "E1") }
    context "with valid details" do

      before do
        request.env["HTTP_REFERER"] = "where_i_came_from"
        post :create, next_of_kin: Fabricate.attributes_for(:next_of_kin), employee_id: sam.id
      end
      it "redirects to :back" do
        expect(response).to redirect_to "where_i_came_from"
      end
      it "creates a next of kin contact" do
        expect(NextOfKin.count).to eq(1)
      end
      it "associates the employee's emp_id to the next of kin contact" do
        expect(NextOfKin.first.employee).to eq(sam)
      end
    end

    context "with invalid details" do
      it "does not create a next of kin contact" do
        request.env["HTTP_REFERER"] = "where_i_came_from"
        post :create, next_of_kin: { other_names: "Adjei" }, employee_id: sam.id
        expect(NextOfKin.count).to eq(0)
      end
      it "renders employee/show page" do
        request.env["HTTP_REFERER"] = "where_i_came_from"
        post :create, next_of_kin: { other_names: "Adjei" }, employee_id: sam.id
        expect(response).to render_template "employees/show"
      end
    end
  end
end
