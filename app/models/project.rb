class Project < ApplicationRecord
  validates_presence_of :name, :description, :start_date
  validates_associated :coordinator

  belongs_to :coordinator, class_name: 'User'

end
