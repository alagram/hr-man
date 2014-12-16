class ModifyHoldays < ActiveRecord::Migration
  def change
    remove_column :holidays, :datetime
    add_column :holidays, :date, :datetime
  end
end
