require 'spec_helper'
require 'formtastic/inputs/trix_editor_input'

describe Trix do
  include FormtasticSpecHelper

  it 'renders the correct html markup' do
    @output_buffer = ''
    post = mock_model('Post', body: 'My super awesome post content on kalina.tech')

    concat(semantic_form_for(post) do |builder|
      concat(builder.input(:body, as: :trix_editor))
    end)

    expected_html = [
      '<div class="trix-editor-wrapper">',
      '<trix-editor input="post_body"></trix-editor>',
      '<input id="post_body" type="hidden" value="' + post.body + '" name="post[body]" />',
      '</div>'
    ].join

    expect(@output_buffer).to include(expected_html)
  end
end
