class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pseudo, :string
    add_column :users, :score_search_vache, :integer, default: 10, null: false
    add_column :users, :score_search_chevre, :integer, default: 10, null: false
    add_column :users, :score_search_brebis, :integer, default: 10, null: false
  end
end
