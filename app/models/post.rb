class Post < ApplicationRecord
    belongs_to: user 
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags     
    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :child_posts, class_name: 'Post', foreign_key: 'parent_post_id', dependent: :destroy

    validates :title, presence: { message: "Oh no! the title cannot be empty, please choose one." }
    validates :content, presence: { message: "This cannot be empty. Please write a content for the post." }
    validates :user_id, presence: { message: "Ups, the user id is missing. Every post must be associated with a user, so enter one please." }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "Oh no! this must not be negative please enter a valid number of answers." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "The likes count cant be negative, so please enter a valid number" }

    before_validation :set_default_published_at, on: :create

    private

    def set_default_published_at
        self.published_at ||= Time.zone.now
    end
end 