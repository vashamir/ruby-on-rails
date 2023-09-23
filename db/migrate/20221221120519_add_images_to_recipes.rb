class AddImagesToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :images, :string
    remove_column :recipes, :image, :string
  end
end
