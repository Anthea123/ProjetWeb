class AddStudentIdToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :student_id, :integer
  end
end
