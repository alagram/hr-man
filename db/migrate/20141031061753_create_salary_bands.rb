class CreateSalaryBands < ActiveRecord::Migration
  def change
    create_table :salary_bands do |t|
      t.decimal :min_salary, precision: 10, scale: 4
      t.decimal :max_salary, precision: 10, sclae: 4
      t.string :band_name
      t.string :band_symbol
    end
  end
end
