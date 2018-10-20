class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :price_cents, default: 0
      t.references :member, index: true, foreign_key: true
      t.references :member_game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
