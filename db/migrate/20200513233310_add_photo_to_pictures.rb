class AddPhotoToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :photo, :string
  end
end
