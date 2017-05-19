class AddTeacherIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :teacher_id, :integer
  end
end
