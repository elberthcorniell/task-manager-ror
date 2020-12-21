class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { in: 4..16 }

    has_many :groups
    has_many :tasks
end
