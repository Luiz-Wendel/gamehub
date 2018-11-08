class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :member, index: true, foreign_key: true
      t.references :exchange, index: true, foreign_key: true
      t.references :sale, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
