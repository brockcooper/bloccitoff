class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :created_at
  has_many :todos
  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
