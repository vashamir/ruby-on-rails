class AddImageToRecipes2 < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :image, :string
    remove_column :recipes, :images, :string
  end
end
