class Hospital < ActiveRecord::Base
  include ModelSupport

  validates :number, presence: true, uniqueness: true

  has_and_belongs_to_many :employees, join_table: :employees_hospitals

  accepts_nested_attributes_for :employees

end