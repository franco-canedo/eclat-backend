class CreateProjectPictures < ActiveRecord::Migration[6.0]
  def change
    create_table :project_pictures do |t|
      t.string :address
      t.integer :project_id
      t.string :photo

      t.timestamps
    end
  end
end
