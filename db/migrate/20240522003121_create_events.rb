class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name, limit: 100, null: false
      t.text :description
      t.timestamp :started_at
      t.timestamp :finished_at

      t.timestamps
    end
  end
end
