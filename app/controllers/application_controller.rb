class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_i18n_locale_from_params
  before_filter :prepare_for_mobile

  private
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  # For mobile site
  def mobile_device?
    puts "user_agent #{request.user_agent}"
    puts "session #{session}"
    if session[:mobile_param]
      ["1", "2"].include? session[:mobile_param]
    else
      request.user_agent =~ /android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|i(P|p)(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    #session[:mobile_param] = params[:mobile] if params[:mobile]
    session[:mobile_param] = params[:mobile] if params[:mobile]
    #request.format = :mobile if mobile_device?
    if mobile_device?
      if "2" == session[:mobile_param]
        request.format = :mobile
      else
        request.format = :mobi
      end
    end
  end
end
