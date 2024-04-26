class Tag < ApplicationRecord

    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags

    # has_and_belongs_to_many :posts

    validates :name, presence: { message: "A name is required, so please provide a name for the tag." }, uniqueness: { message: "Oh no! the tag name must be unique, you entered one that already exists." }
    def initialize(attributes = {}) 
        super(attributes)
    end
end 
