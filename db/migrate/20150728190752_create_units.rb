class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :address
      t.integer :dues
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
