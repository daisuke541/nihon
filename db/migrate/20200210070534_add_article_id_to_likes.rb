class AddArticleIdToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :article_id, :integer
  end
end
