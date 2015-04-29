namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    todos = Todo.where("created_at <= ?", Time.now - 7.days)
    todos.each do |t|
      t.update(if_complete: true)
    end
  end

end
