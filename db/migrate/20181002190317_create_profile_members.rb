class CreateProfileMembers < ActiveRecord::Migration
  def change
    create_table :profile_members do |t|
      t.string :name
      t.string :username
      t.date :birthdate
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
