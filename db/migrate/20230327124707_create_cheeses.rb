class CreateCheeses < ActiveRecord::Migration[7.0]
  def change
    create_table :cheeses do |t|
      t.string :name
      t.string :affinage
      t.string :lait
      t.string :pate
      t.string :saison
      t.string :category
      t.string :picture_url
      t.text :description_1
      t.text :description_2
      t.boolean :filter_pregnant
      t.boolean :filter_vache
      t.boolean :filter_chevre
      t.boolean :filter_brebis
      t.boolean :filter_AOP
      t.string :wine
      t.string :address

      t.timestamps
    end
  end
end
