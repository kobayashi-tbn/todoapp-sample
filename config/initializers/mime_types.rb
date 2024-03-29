# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

Mime::Type.register_alias "text/html", :mobile
Mime::Type.register_alias "text/html", :mobi

ActionController::Responder.class_eval do
  alias :to_mobile :to_html
  alias :to_mobi :to_html
end