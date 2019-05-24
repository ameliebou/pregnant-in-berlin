class AddUrlToKindergartens < ActiveRecord::Migration[5.2]
  def change
    add_column :kindergartens, :url, :string
  end
end
