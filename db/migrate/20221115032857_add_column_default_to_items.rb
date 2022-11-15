class AddColumnDefaultToItems < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :is_active, default: true
  end
end
