class CreateMaritals < ActiveRecord::Migration
  def change
    create_table :maritals do |t|
      t.string :name
      t.boolean :isactive
    end
  end
end
