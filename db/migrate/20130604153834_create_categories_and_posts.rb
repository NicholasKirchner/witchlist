class CreateCategoriesAndPosts < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    create_table :posts do |t|
      t.string :author
      t.string :email
      t.integer :price
      t.string :content
      t.string :key
      t.references :category
    end

  end
end
