class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.text :description


      t.timestamps :created_on
    end


    add_index :users, :reset_password_token, :unique => true
   
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
    end
  end
end

