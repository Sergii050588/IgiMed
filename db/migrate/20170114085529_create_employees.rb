class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees, id: false, primary_key: :id do |t|
      t.string :id,        null: false, primary_key: true
      t.string :last_name, null: false
      t.string :position,  null: false
      t.date   :birthday,  null: false

      t.timestamps         null: false
    end
  end
end
