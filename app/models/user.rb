class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { in: 4..16 }

    has_many :groups
    has_many :tasks, class_name: 'Task', foreign_key: :author_id
end
