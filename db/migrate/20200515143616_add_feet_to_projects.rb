class AddFeetToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :square_feet, :string
  end
end
