helpers do

  def monthly_total
    total_cost = []
    channels = current_user.channels
    channels.each do |channel|
      total_cost << channel.price_per_month
    end
    total_cost.reduce(:+)
  end

  def current_user
    @_cached_user ||= User.find(session[:user_id]) if logged_in?
  end

end