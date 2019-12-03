class AddDayToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :day, :string
  end
end
