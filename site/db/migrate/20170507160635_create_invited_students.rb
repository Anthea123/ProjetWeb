class CreateInvitedStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :invited_students do |t|
      t.string :surname
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
