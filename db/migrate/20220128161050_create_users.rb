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

      # Authlogic::ActsAsAuthentic::Login
      t.string    :login

      # Authlogic::ActsAsAuthentic::Password
      t.string    :crypted_password
      t.string    :password_salt

      # Authlogic::ActsAsAuthentic::PersistenceToken
      t.string    :persistence_token
      t.index     :persistence_token, unique: true

      # Authlogic::ActsAsAuthentic::SingleAccessToken
      t.string    :single_access_token
      t.index     :single_access_token, unique: true

      # Authlogic::ActsAsAuthentic::PerishableToken
      t.string    :perishable_token
      t.index     :perishable_token, unique: true

      t.timestamps
    end
  end
end
