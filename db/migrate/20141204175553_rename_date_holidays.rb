class RenameDateHolidays < ActiveRecord::Migration
  def change
    rename_column :holidays, :date, :hol_date
  end
end
