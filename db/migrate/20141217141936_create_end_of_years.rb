class CreateEndOfYears < ActiveRecord::Migration
  def change
    create_table :end_of_years do |t|
      t.string :current_year
      t.boolean :isactive
    end
  end
end
