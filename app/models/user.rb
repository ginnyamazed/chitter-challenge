# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email,
            presence: true,
            format: {
              with: /@/,
              message: 'should look like an email address.'
            },
            length: { maximum: 100 },
            uniqueness: {
              case_sensitive: false,
              if: :will_save_change_to_email?
            }

  validates :username, presence: true,
                       format: {
                         with: /\A[a-z0-9]+\z/,
              message: 'should use only letters and numbers.'
                       },
                       length: { within: 3..100 },
                       uniqueness: {
                         case_sensitive: false,
              if: :will_save_change_to_username?
                       }

  validates :password, presence: true,
                       length: { within: 8..30 }

end
