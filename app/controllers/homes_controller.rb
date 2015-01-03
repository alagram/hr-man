class HomesController < ApplicationController
  def welcome
    @employee = current_user
    render template: "employees/show"
  end
end
