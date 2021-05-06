class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :intro, :text
    add_column :users, :profile_image, :string
  end
end
