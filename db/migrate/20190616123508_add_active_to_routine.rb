class AddActiveToRoutine < ActiveRecord::Migration[5.2]
  def change
    add_column :routines, :active, :boolean, null: false, default: true
  end
end
