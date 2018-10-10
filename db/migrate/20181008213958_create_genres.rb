class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :description, limit: 25

      t.timestamps null: false
    end
  end
end
