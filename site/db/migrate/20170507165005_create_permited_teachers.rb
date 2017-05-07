class CreatePermitedTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :permited_teachers do |t|
      t.string :surname
      t.string :name
      t.string :email
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
