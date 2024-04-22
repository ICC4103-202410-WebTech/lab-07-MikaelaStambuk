class Post < ApplicationRecord
    belongs_to: user 
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags     
    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :child_posts, class_name: 'Post', foreign_key: 'parent_post_id', dependent: :destroy

    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }

    before_validation :set_default_published_at, on: :create

    private

    def set_default_published_at
        self.published_at ||= Time.zone.now
    end
end 