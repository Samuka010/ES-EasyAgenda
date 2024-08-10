class RemoveDescriptionToEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :description, :text
  end
end
