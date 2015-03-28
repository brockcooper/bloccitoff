class List < ActiveRecord::Base
  belongs_to :user
  has_many :todos
  validates :title, length: { minimum: 5 }, presence: true
end
