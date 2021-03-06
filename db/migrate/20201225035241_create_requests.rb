class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.text :conten
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :requests, [:user_id, :created_at]
  end
end
