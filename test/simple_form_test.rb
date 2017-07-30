require 'test_helper'
require 'trix_editor_cases'

require 'simple_form'

SimpleForm.setup do |config|
  config.custom_inputs_namespaces << 'Trix::SimpleForm'
end

require 'trix/simple_form/trix_editor_input'

class SimpleFormTest < Minitest::Test
  include TrixEditorCases

  include SimpleForm::ActionViewExtensions::FormHelper

  def controller
    Class.new do
      def action_name
        'hi'
      end
    end.new
  end

  private

  def render_form
    simple_form_for(@post, url: 'some-url') do |f|
      f.input(:body, as: :trix_editor)
    end
  end
end
