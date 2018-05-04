class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  console do
    ActiveRecord::Base.connection
  end
end
