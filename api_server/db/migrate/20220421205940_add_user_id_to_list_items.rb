class AddUserIdToListItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :list_items, :user, foreign_key: true
  end
end
