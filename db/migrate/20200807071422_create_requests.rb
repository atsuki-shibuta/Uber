class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true, null: false
      t.string :start, null: false
      t.string :goal, null: false
      t.integer :cost, null: false
      t.integer :status, null: false, default: "0"
      t.timestamps
    end
  end
end
