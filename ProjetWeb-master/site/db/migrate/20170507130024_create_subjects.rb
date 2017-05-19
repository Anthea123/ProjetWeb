class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
