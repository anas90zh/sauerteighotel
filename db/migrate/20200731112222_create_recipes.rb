class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|

      t.string :title
      t.text :description
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
