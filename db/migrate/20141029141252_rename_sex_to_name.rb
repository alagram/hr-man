class RenameSexToName < ActiveRecord::Migration
  def change
    rename_column :genders, :sex, :name
  end
end
