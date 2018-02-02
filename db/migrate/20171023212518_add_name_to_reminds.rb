class AddNameToReminds < ActiveRecord::Migration
  def change
    add_column :reminds, :name, :string
  end
end
