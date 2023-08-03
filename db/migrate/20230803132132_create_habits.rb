class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.references :user, null: false, foreign_key: true
      t.text :name
      t.text :description
      t.text :type

      t.timestamps
    end
  end
end
