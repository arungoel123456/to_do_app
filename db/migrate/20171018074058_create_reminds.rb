class CreateReminds < ActiveRecord::Migration
  def change
    create_table :reminds do |t|
      t.string :task
      t.boolean :status

      t.timestamps null: false
    end
  end
end
