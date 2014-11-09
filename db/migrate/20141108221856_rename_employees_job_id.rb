class RenameEmployeesJobId < ActiveRecord::Migration
  def change
    rename_column :employees, :job_id, :job_title_id
  end
end
