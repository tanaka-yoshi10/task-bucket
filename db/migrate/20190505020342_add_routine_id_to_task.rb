class AddRoutineIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :routine, foreign_key: true
  end
end
