require 'spec_helper'
require 'formtastic/inputs/trix_editor_input'

describe Trix, type: :integration do
  include FormtasticSpecHelper

  it 'renders the correct html markup' do
    @output_buffer = ''
    post = mock_model('Post', body: 'My super awesome post content on kalina.tech')

    concat(semantic_form_for(post) do |builder|
      concat(builder.input(:body, as: :trix_editor))
    end)

    input_regexp_string = '<input (?=.*type="hidden")(?=.*id="post_body")(?=.*value="' + post.body + '").*\/>'
    input_regexp = Regexp.new(input_regexp_string)
    expected_editor_tag = '<trix-editor input="post_body"></trix-editor>'

    expect(@output_buffer).to include(expected_editor_tag), 'Output HTML contains the editor tag.'
    expect(@output_buffer).to match(input_regexp), 'Output HTML contains the hidden input field.'
  end
end
