class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :kind, index: true
      t.string :rmk

      t.timestamps
    end
  end
end
