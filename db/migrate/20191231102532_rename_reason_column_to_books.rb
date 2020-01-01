class RenameReasonColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :reason, :category
  end
end
