class AddSubjectIdToTests < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :subject_id, :integer
  end
end
