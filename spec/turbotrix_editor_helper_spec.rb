require 'spec_helper'
require 'turbotrix/form'

describe TurbotrixEditorHelper, type: :helper do
  describe '#trix_editor' do
    it 'returns a turbotrix editor tag' do
      blog = mock_model('Blog', text: 'Description')

      assign(:blog, blog)
      expect(helper.trix_editor(:blog, :text)).to include('turbotrix-editor')
    end
  end

  describe '#trix_editor_tag' do
    it 'returns a turbotrix editor tag' do
      expect(helper.trix_editor_tag('text')).to include('turbotrix-editor')
    end

    it 'accepts a string class option' do
      expect(helper.trix_editor_tag('text', nil, class: 'one two three')).to(
        match(/<turbotrix-editor class="formatted_content turbotrix-content one two three"/)
      )
    end

    it 'accepts a simple array class option' do
      expect(helper.trix_editor_tag('text', nil, class: %w[one two three])).to(
        match(/<turbotrix-editor class="formatted_content turbotrix-content one two three"/)
      )
    end

    it 'accepts a mixed array class option' do
      expect(helper.trix_editor_tag('text', nil, class: ['one two', :three])).to(
        match(/<turbotrix-editor class="formatted_content turbotrix-content one two three"/)
      )
    end

    it 'accepts spellcheck option' do
      expect(helper.trix_editor_tag('text', nil, spellcheck: true)).to(
        include('spellcheck="true"')
      )
    end

    it 'accepts placeholder option' do
      expect(helper.trix_editor_tag('text', nil, placeholder: 'Sample text')).to(
        include('placeholder="Sample text"')
      )
    end

    it 'accepts toolbar option' do
      expect(helper.trix_editor_tag('text', nil, toolbar: true)).to(
        include('toolbar="true"')
      )
    end

    it 'accepts tabindex option' do
      expect(helper.trix_editor_tag('text', nil, tabindex: 1)).to(
        include('tabindex="1"')
      )
    end

    it 'ignores non-whitelisted options' do
      expect(helper.trix_editor_tag('text', nil, non_existing_option: 2)).not_to(
        include('non_existing_option="2"')
      )
    end
  end
end
