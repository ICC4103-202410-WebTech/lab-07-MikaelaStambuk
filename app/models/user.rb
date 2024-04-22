class User < ApplicationRecord
    has_many :posts, dependent: :destroy 

    validates :name, presence: { message: "Oh no! Please enter your name." }
    validates :email, presence: { message: "Oh no, i´m sorry this can't be blank. Please enter your email." }, uniqueness: { case_sensitive: false, message: "This is bad, your mail is already registered. Please use a different one." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "This is an invalid format. Please enter a valid email address or you wouldn´t be able to register." }
    validates :password, presence: { message: "Ups, your password is required. Please enter one." }, length: { minimum: 6, message: "It has to be at least 6 characters long." }

    before_save :downcase_email
    private

    def downcase_email
        self.email.downcase!
    end
end