require 'spec_helper'
require 'trix/simple_form/turbotrix_editor_input'

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

  it 'outputs HTML containing the turbotrix editor tag' do
    assert_select 'turbotrix-editor[input="post_body"]'
  end

  it 'outputs HTML containing the turbotrix editor tag with a turbotrix-content class' do
    assert_select 'turbotrix-editor.turbotrix-content'
  end
end
