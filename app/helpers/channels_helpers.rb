helpers do

  def monthly_total
    total_cost = []
    channels = current_user.channels
    channels.each do |channel|
      total_cost << channel.price_per_month
    end
    total_cost.reduce(:+)
  end


  def currently_subscribed?
    current_user.channels.include?(Channel.find_by(id: params[:id] ))
  end

end
