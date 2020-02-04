class Article < ApplicationRecord

validates :content, {presence: true, length: {maximum: 1000}}
# validates user_id
default_scope -> { order(created_at: :desc) }

def user
    return User.find_by(id: self.user_id)
  end
end
