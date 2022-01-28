# frozen_string_literal: true

class User < ApplicationRecord

  validates :email,
            format: {
              with: /@/,
              message: 'should look like an email address.'
            },
            length: { maximum: 100 },
            uniqueness: {
              case_sensitive: false,
              if: :will_save_change_to_email?
            }

  validates :username,
            format: {
              with: /\A[a-z0-9]+\z/,
              message: 'should use only letters and numbers.'
            },
            length: { within: 3..100 },
            uniqueness: {
              case_sensitive: false,
              if: :will_save_change_to_username?
            }

  validates :password,
            confirmation: { if: :require_password? },
            length: {
              minimum: 8,
              if: :require_password?
            }
  validates :password_confirmation,
            length: {
              minimum: 8,
              if: :require_password?
            }
end
