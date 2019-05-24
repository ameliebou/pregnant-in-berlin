class AddOpeningtimesToKindergartens < ActiveRecord::Migration[5.2]
  def change
    add_column :kindergartens, :open_time_mon, :string
    add_column :kindergartens, :open_time_tue, :string
    add_column :kindergartens, :open_time_wed, :string
    add_column :kindergartens, :open_time_thu, :string
    add_column :kindergartens, :open_time_fri, :string
  end
end
