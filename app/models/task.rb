class Task < ApplicationRecord

  has_many :taskcompleteds
  has_many :users, through: :taskcompleteds
end
