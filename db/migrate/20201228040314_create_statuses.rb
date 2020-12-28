class CreateStatuses < ActiveRecord::Migration[6.0]
	def change
		create_table :statuses do |t|
			t.text :content
			t.references :user, foreign_key: true
			t.timestamps
		end
		add_index :statuses, [:user_id, :created_at]
	end
end