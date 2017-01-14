class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals, id: false, primary_key: :id do |t|
      t.string   :id,     null: false, primary_key: true
      t.integer  :number, null: false

      t.timestamps        null: false
    end
  end
end
