class RenameYearsToRecYear < ActiveRecord::Migration
  def change
    rename_column :leave_records, :year, :rec_year
  end
end
