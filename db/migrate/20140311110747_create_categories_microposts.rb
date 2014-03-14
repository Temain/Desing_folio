class CreateCategoriesMicroposts < ActiveRecord::Migration
  def change
    create_table :categories_microposts do |t|
      t.belongs_to :category
      t.belongs_to :micropost
    end
  end
end
