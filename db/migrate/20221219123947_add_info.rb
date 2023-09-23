class AddInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :about_me, :text
  end
end
