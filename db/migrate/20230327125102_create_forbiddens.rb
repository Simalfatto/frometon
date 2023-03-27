class CreateForbiddens < ActiveRecord::Migration[7.0]
  def change
    create_table :forbiddens do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cheese, null: false, foreign_key: true

      t.timestamps
    end
  end
end
