require 'spec_helper'
require 'formtastic/inputs/trix_editor_input'

describe TrixEditorInput, type: :view do
  include FormtasticSpecHelper

  let(:post) { mock_model('Post', body: 'body') }

  let(:form) do
    semantic_form_for(post) do |f|
      f.input(:body, as: :trix_editor)
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

  context 'input_html options' do
    let(:form) do
      semantic_form_for(post) do |f|
        f.input :body,
                as: :trix_editor,
                input_html: { autofocus: true, placeholder: 'my text', data: { some_stuff: 1 } }
      end
    end

    it 'sets autofocus on the trix-editor-tag' do
      assert_select 'trix-editor[autofocus="autofocus"]'
      assert_select 'input[type="hidden"][autofocus="autofocus"]', false
    end

    it 'sets placeholder on the trix-editor-tag' do
      assert_select 'trix-editor[placeholder="my text"]'
      assert_select 'input[type="hidden"][placeholder="placeholder"]', false
    end

    it 'sets other options on the hidden input' do
      assert_select 'input[type="hidden"][data-some-stuff="1"]'
      assert_select 'trix-editor[data-some-stuff="1"]', false
    end
  end
end
