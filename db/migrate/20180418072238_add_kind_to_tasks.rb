class AddKindToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :kind, :integer, null: false
  end
end
