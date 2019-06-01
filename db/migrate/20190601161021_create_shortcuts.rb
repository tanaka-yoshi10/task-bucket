class CreateShortcuts < ActiveRecord::Migration[5.2]
  def change
    create_table :shortcuts do |t|
      t.string :title, null: false
      t.references :project, foreign_key: true
      t.integer :position, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
