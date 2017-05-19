class AddTeacherIdToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :teacher_id, :integer
  end
end
