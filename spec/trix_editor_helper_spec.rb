require 'spec_helper'
require 'trix/form'

describe TrixEditorHelper, type: :helper do
  describe '#trix_editor' do
    it 'returns a trix editor tag' do
      blog = mock_model('Blog', text: 'Description')

      assign(:blog, blog)
      expect(helper.trix_editor(:blog, :text)).to include('trix-editor')
    end

    it 'uses value from object' do
      blog = mock_model('Blog', text: 'my_original_value')

      assign(:blog, blog)
      expect(helper.trix_editor(:blog, :text)).to include('my_original_value')
    end

    it 'uses a provided value instead of value from object' do
      blog = mock_model('Blog', text: 'my_original_value')

      assign(:blog, blog)
      expect(helper.trix_editor(:blog, :text, value: "my_provided_value")).to include('my_provided_value')
    end
  end

  describe '#trix_editor_tag' do
    it 'returns a trix editor tag' do
      expect(helper.trix_editor_tag('text')).to include('trix-editor')
    end
  end
end
