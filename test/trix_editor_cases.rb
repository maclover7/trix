require 'active_model'
require 'action_view'

class Post
  include ActiveModel::Model
  attr_accessor :body
end

module RailsCompatibilityLayer
  include ActionPack
  include ActionView::Context if defined?(ActionView::Context)
  include ActionController::RecordIdentifier if defined?(ActionController::RecordIdentifier)
  include ActionView::Helpers::FormHelper
  include ActionDispatch::Routing::PolymorphicRoutes
  include ActionView::RecordIdentifier if defined?(ActionView::RecordIdentifier)

  require 'rails/dom/testing/assertions'
  include Rails::Dom::Testing::Assertions

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

  def posts_path(*)
    ''
  end

  def _routes
    Rails.application.routes
  end
end

module TrixEditorCases
  include RailsCompatibilityLayer

  def setup
    @output_buffer = ''
    @post = Post.new(body: 'body')

    concat render_form
  end

  def test_contains_hidden_input_field
    assert_select format('input[type="hidden"][id="post_body"][value="%s"]', @post.body)
  end

  def test_contains_editor_tag
    assert_select 'trix-editor[input="post_body"]'
  end

  def test_contains_class
    assert_select 'trix-editor.trix-content'
  end

  private

  def document_root_element
    Nokogiri::HTML::Document.parse(@output_buffer).root
  end

  def render_form
    raise NotImplementedError
  end
end
