class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags

    validates :name, presence: { message: "A name is required, so please provide a name for the tag." }, uniqueness: { message: "Oh no! the tag name must be unique, you entered one that already exists." }
end
end
