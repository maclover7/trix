require 'spec_helper'
require 'trix/form'

describe TrixEditorHelper, type: :helper do
  describe '#trix_editor' do
    it 'returns a trix editor tag' do
      blog = mock_model('Blog', text: 'Description')

      assign(:blog, blog)
      expect(helper.trix_editor(:blog, :text)).to include('trix-editor')
    end
  end

  describe '#trix_editor_tag' do
    it 'returns a trix editor tag' do
      expect(helper.trix_editor_tag('text')).to include('trix-editor')
    end

    it 'accepts a string class option' do
      expect(helper.trix_editor_tag('text', nil, class: 'one two three')).to(
        match(/<trix-editor class="formatted_content trix-content one two three"/)
      )
    end

    it 'accepts a simple array class option' do
      expect(helper.trix_editor_tag('text', nil, class: %w[one two three])).to(
        match(/<trix-editor class="formatted_content trix-content one two three"/)
      )
    end

    it 'accepts a mixed array class option' do
      expect(helper.trix_editor_tag('text', nil, class: ['one two', :three])).to(
        match(/<trix-editor class="formatted_content trix-content one two three"/)
      )
    end

    it 'accepts an autofocus option' do
      expect(helper.trix_editor_tag('text', nil, autofocus: true)).to(
        match(/<trix-editor.*autofocus="autofocus"/)
      )
    end

    it 'accepts a placeholder option' do
      expect(helper.trix_editor_tag('text', nil, placeholder: 'my text')).to(
        match(/<trix-editor.*placeholder="my text"/)
      )
    end
  end
end
