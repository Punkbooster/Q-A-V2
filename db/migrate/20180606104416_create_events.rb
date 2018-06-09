class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :time_zone
      t.string :event_code
      t.references :user, index: true

      t.timestamps
    end
  end
end
