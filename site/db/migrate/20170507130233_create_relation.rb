class CreateRelation < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|

      t.timestamps
    end
  end
end
