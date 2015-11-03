class Plan < ActiveRecord::Base
  has_many :users
  has_one :profile
end
