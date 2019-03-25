class Books < ActiveRecord::Migration[4.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.float :price
      t.string :subject
    end
  end
end
