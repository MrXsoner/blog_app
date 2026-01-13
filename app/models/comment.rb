class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body
  after_create_commit :notify_recipient

  private

  def notify_recipient
    CommentNofiticationNotifier.with(comment: self, post: post).deliver_later(post.user)
  end
end
