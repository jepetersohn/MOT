module SessionHelper
  def trusted_reviewer(auth_key)
    if auth_key == "987654321"
      current_user.trusted_reviewer = true
    end
  end

  def trusted_reviewer?
    if active_session?
      return true if current_user.trusted_reviewer = true
    end
  end

  def trusted_rater?
    if active_session?
      return true if current_user.trusted_reviewer == false
    else
      nil
    end
  end

  def current_user
    if active_session?
      User.find_by(id: session[:user_id])
    end
  end

  def active_session?
    session[:user_id] != nil
  end

end
