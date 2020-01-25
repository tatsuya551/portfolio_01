class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.bigint     :user_id, foreign_key: true, null: false
      t.bigint     :book_id, foreign_key: true, null: false
      t.bigint     :impression_id, foreign_key: true
      t.string     :content
      t.date       :date
      t.integer    :status, null: false, default: 0
      t.timestamps
    end
    add_index :notices, :user_id
    add_index :notices, :book_id
    add_index :notices, :impression_id
  end
end
