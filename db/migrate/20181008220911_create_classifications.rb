class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :rating_system, limit: 3

      t.timestamps null: false
    end
  end
end
