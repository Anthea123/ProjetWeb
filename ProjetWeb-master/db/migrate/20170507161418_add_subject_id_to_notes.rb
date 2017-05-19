class AddSubjectIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :subject_id, :integer
  end
end
