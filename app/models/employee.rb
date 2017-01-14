class Employee < ActiveRecord::Base
  include ModelSupport

  validates :last_name, presence: true, length: { in: 2..20 }
  validates :birthday, presence: true, date: true
  validates :position, presence: true

  has_and_belongs_to_many :hospitals, join_table: :employees_hospitals

  POSITIONS_LIST = ["Лікар", "Медична сестра", "Фельдшер"]

  accepts_nested_attributes_for :hospitals

  def self.not_connected_to(hospital)
    where(<<-SQL, hospital.id)
      NOT EXISTS (SELECT 1
        FROM   employees_hospitals
        WHERE  employees.id = employees_hospitals.employee_id
        AND employees_hospitals.hospital_id = ?
        )
    SQL
  end

end
