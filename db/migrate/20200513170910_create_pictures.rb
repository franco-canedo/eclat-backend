class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
