class User < ApplicationRecord

  has_secure_password

  has_many :articles

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}


  def articles
    return Article.where(user_id: self.id)
  end
end
