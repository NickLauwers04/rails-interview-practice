class RenamePrivateToIsPrivate < ActiveRecord::Migration[5.0]
  def change
  	rename_column :questions, :private, :is_private
  end
end
