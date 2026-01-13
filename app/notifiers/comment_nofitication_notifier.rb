# To deliver this notification:
#
# CommentNotificationNotifier.with(record: @post, message: "New post").deliver(User.all)

class CommentNofiticationNotifier < ApplicationNotifier
  # Add your delivery methods
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_post"
  # end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end
  #
  def message
    "New comment on your post: #{params[:post].title.truncate(30)}"
  end
  def message2
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "#{@user.email} commented on #{@post.title.truncate(10)}"
  end
  # Add required params
  #
  # required_param :message

  def url
    Rails.application.routes.url_helpers.post_path(params[:post])
  end
  # Compute recipients without having to pass them in
  #
  # recipients do
  #   params[:record].thread.all_authors
  # end
end
