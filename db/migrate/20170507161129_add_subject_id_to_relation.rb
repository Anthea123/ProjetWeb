class AddSubjectIdToRelation < ActiveRecord::Migration[5.0]
  def change
    add_column :relations, :subject_id, :integer
  end
end
