class AddCompanyIdToGenders < ActiveRecord::Migration
  def change
    add_column :genders, :company_id, :integer
  end
end
