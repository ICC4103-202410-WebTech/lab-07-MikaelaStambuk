class Post < ApplicationRecord
    belongs_to: user 
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags     
    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :child_posts, class_name: 'Post', foreign_key: 'parent_post_id', dependent: :destroy
end 