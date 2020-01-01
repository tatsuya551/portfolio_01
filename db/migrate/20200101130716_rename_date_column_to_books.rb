class RenameDateColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :date, :buy_date
  end
end
