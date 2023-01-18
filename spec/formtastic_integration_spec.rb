require 'spec_helper'
require 'formtastic/inputs/trix_editor_input'

describe TurbotrixEditorInput, type: :view do
  include FormtasticSpecHelper

  let(:post) { mock_model('Post', body: 'body') }

  let(:form) do
    semantic_form_for(post) do |f|
      f.input(:body, as: :turbotrix_editor)
    end
  end

  before do
    @output_buffer = ''
    concat(form)
  end

  it 'renders the correct html markup' do
    # Output HTML contains the hidden input field
    assert_select format('input[type="hidden"][id="post_body"][value="%s"]', post.body)

    # Output HTML contains the editor tag
    assert_select 'trix-editor[input="post_body"]'

    # Output editor tag has trix-content class
    assert_select 'trix-editor.trix-content'
  end
end
