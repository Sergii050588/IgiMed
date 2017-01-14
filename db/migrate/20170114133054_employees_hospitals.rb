class EmployeesHospitals < ActiveRecord::Migration
  def change
    create_table :employees_hospitals, id: false do |t|
      t.string :hospital_id, index: true
      t.string :employee_id, index: true
    end
  end
end
