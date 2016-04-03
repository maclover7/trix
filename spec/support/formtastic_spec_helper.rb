require 'formtastic'

module FormtasticSpecHelper
  include ActionPack
  include ActionView::Context if defined?(ActionView::Context)
  include ActionController::RecordIdentifier if defined?(ActionController::RecordIdentifier)
  include ActionView::Helpers::FormHelper
  include Formtastic::Helpers::FormHelper
  include ActionDispatch::Routing::PolymorphicRoutes
  include ActionView::RecordIdentifier if defined?(ActionView::RecordIdentifier)
  Formtastic::FormBuilder.input_class_finder = Formtastic::InputClassFinder

  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = 'utf-8'
    config.active_support.deprecation = :stderr
    config.secret_key_base = 'secret'
    config.eager_load = false
  end

  def protect_against_forgery?
    false
  end

  def post_path(*)
    ''
  end
end
