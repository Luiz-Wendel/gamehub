class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, limit: 50
      t.text :description, limit: 500
      t.references :genre, index: true, foreign_key: true
      t.references :classification, index: true, foreign_key: true
      t.references :platform, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
