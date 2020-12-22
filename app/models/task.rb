class Task < ApplicationRecord
  validates :name, presence: true, length: { in: 4..16 }
  validates :description, presence: false, length: { in: 4..64 }

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true
end
