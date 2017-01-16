class AddUserToSharing < ActiveRecord::Migration[5.0]
  def change
    add_column :sharings, :user_id, :integer
  end
end
