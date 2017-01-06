class ApplicationController < ActionController::Base
  include SessionHelper
  include ReviewHelper

  protect_from_forgery with: :exception

end
