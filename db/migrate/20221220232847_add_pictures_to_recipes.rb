class AddPicturesToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :pictures, :string
  end
end
