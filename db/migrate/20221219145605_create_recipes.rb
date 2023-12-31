class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :receipe_text
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
