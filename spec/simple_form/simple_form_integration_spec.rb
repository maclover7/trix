require 'spec_helper'
require 'trix/simple_form/trix_editor_input'

describe Trix::SimpleForm::TrixEditorInput, type: :view do
  include SimpleFormSpecHelper

  let(:post) { mock_model('Post', body: 'My super awesome post content.') }

  let(:form) do
    simple_form_for(post, url: 'some-url') do |f|
      f.input(:body, as: :trix_editor)
    end
  end

  before { concat(form) }

  it 'outputs HTML containing the hidden input field' do
    assert_select format('input[type="hidden"][id="post_body"][value="%s"]', post.body)
  end

  it 'outputs HTML containing the trix editor tag' do
    assert_select 'trix-editor[input="post_body"]'
  end
end
