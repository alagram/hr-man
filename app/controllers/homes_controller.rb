class HomesController < ApplicationController
  before_action :require_user
  def welcome
    @employee = current_user
    render template: "employees/show"
  end
end
