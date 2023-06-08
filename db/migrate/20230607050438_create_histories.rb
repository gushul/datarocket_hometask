class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :type
      t.string :user
      t.date :created_at
    end
  end
end
