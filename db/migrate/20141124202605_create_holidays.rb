class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :name
      t.date :datetime
      t.boolean :isactive
      t.timestamps
    end
  end
end
