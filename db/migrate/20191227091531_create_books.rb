class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.bigint     :user_id, foreign_key: true, null: false
      t.string     :title, null: false
      t.string     :author, null: false
      t.string     :publisher, null: false
      t.integer    :reason, null: false
      t.integer    :status, null: false, default: 0
      t.string     :image
      t.date       :date,null: false
      t.timestamps
    end
    add_index :books, :title
    add_index :books, :author
    add_index :books, :publisher
    add_index :books, :reason
  end
end