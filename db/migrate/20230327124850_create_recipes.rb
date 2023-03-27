class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.text :content
      t.string :name
      t.string :picture_url
      t.string :link_to_source
      t.references :cheese, null: false, foreign_key: true

      t.timestamps
    end
  end
end
