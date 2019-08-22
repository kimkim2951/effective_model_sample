class AddFinishedToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :finished, :boolean, default: false, null: false
  end
end
