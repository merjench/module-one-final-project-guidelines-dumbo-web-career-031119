class AddReviewToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :review, :text
  end
end
