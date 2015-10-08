class Event < ActiveRecord::Base
  belongs_to :registered_application
  has_many :users, through: :registered_applications
end
