class AddUserToReminds < ActiveRecord::Migration
  def change
    add_reference :reminds, :user, index: true, foreign_key: true
  end
end
