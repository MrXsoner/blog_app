class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user
  before_action :set_query

  def set_query
    @query = Post.ransack(params[:q])
  end

  private

  def set_notifications
    notifications = current_user.notifications.order(created_at: :desc).limit(9)
    @unread = notifications.where(read_at: nil)
    @read = notifications.where.not(read_at: nil)
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
