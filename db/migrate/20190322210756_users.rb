class Users < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio 
    end
  end
end
