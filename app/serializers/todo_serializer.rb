class TodoSerializer < ActiveModel::Serializer
  attributes :id, :description, :list_id, :created_at

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
