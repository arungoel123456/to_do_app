class AddAlarmToReminds < ActiveRecord::Migration
  def change
    add_column :reminds, :alarm, :datetime
  end
end
