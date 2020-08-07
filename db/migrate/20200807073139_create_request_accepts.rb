class CreateRequestAccepts < ActiveRecord::Migration[6.0]
  def change
    create_table :request_accepts do |t|
    	t.references :driver, foreign_key: true, null: false
    	t.references :request, foreign_key: true, null: false
      t.timestamps
    end
  end
end
