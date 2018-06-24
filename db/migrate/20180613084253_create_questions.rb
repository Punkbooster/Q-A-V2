class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :contents
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
