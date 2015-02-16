class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :reminders, :users
  end
end
