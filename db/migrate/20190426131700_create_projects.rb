class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :color, null: false, default: ''
      t.boolean :archive, null: false, default: false

      t.timestamps
    end
  end
end
