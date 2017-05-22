class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :reset_pwd_token
      t.string :reset_pwd_expired_at

      t.timestamps
    end
  end
end
