class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 50 }
    validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
    belongs_to :user
    has_many :comments, dependent: :destroy
    def views
        super || 0
    end
    has_many :notifications, as: :params, class_name: "Noticed::Notification", dependent: :destroy
end
