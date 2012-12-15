class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.mobile # index.mobile.erb
      format.mobi # index.mobi.erb
      format.js   # for ajax
      format.json { render json: @homes }
    end
  end
end
