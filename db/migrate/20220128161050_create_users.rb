# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # Authlogic::ActsAsAuthentic::Username
      t.string    :username
      t.index     :username, unique: true

      # Authlogic::ActsAsAuthentic::Email
      t.string    :email
      t.index     :email, unique: true

      # Authlogic::ActsAsAuthentic::Password
      t.string    :password_digest

      t.timestamps
    end
  end
end
