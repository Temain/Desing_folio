class AddIconColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :icon, :string
  end
end
