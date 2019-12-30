class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.bigint     :book_id, foreign_key: true, null: false
      t.integer    :read_day, null: false
      t.integer    :interest, null: false
      t.integer    :impressed, null: false
      t.integer    :awareness, null: false
      t.integer    :impact, null: false
      t.integer    :practice, null: false
      t.integer    :knowledge, null: false
      t.integer    :rating, null: false
      t.integer    :reread_timing, null: false
      t.text       :note
      t.timestamps
    end
  end
end
