class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :password_digest
      
      t.references :protocol

      t.timestamps
    end
  end
end
