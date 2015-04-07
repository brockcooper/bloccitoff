class List < ActiveRecord::Base
  belongs_to :user
  has_many :todos, dependent: :destroy
  validates :title, length: { minimum: 5 }, presence: true

  default_scope { order('updated_at') }
end
