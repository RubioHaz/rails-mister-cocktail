class AddPictureToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :picture, :string
  end
end
