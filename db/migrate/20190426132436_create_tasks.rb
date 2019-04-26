class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :estimate
      t.references :project
      t.string :title, default: ''
      t.text :comment, default: ''

      t.timestamps
    end
  end
end
