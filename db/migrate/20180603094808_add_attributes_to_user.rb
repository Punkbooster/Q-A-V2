class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    change_table(:users) do |t|
      t.column :company_name, :string
      t.column :country, :string
      t.column :time_zone, :string
      t.column :lead_source, :string
    end
  end
end
