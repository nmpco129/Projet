class AddUsernameToProvider < ActiveRecord::Migration[5.0]
  def change
    add_column :user_tokens, :nickname, :string
  end
end
