class User < ApplicationRecord
    has_many :posts, dependent: :destroy 

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }

    before_save :downcase_email
    private

    def downcase_email
        self.email.downcase!
    end
end