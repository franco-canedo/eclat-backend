class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :address
      t.string :beds
      t.string :baths
      t.string :completion_date

      t.timestamps
    end
  end
end
