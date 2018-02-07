require 'test_helper'
require 'trix_editor_cases'

require 'formtastic'
require 'formtastic/inputs/trix_editor_input'

class FormtasticTest < Minitest::Test
  include TrixEditorCases

  include Formtastic::Helpers::FormHelper
  Formtastic::FormBuilder.input_class_finder = Formtastic::InputClassFinder

  private

  def render_form
    semantic_form_for(@post) do |f|
      f.input(:body, as: :trix_editor)
    end
  end
end
