class CreateSharings < ActiveRecord::Migration[5.0]
  def change
    create_table :sharings do |t|
      t.string :content
      t.timestamps
    end
  end
end
