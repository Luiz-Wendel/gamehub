class CreateMemberGames < ActiveRecord::Migration
  def change
    create_table :member_games do |t|
      t.text :quality, limit: 200
      t.string :platform, limit: 50
      t.references :game, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
