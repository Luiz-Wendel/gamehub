class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :status
      t.references :member, index: true, foreign_key: true
      t.references :exchange, index: true, foreign_key: true
      t.references :sale, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
