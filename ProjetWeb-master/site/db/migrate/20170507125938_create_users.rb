class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :surname
      t.string :name
      t.string :type
      t.timestamps
    end
  end
end
