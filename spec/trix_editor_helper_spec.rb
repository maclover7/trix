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

    it 'has a default input' do
      expect(helper.trix_editor_tag('text', nil)).to(
        include("input=\"trix_input_#{TrixEditorHelper.id}\"")
      )
    end

    it 'accepts a custom input' do
      expect(helper.trix_editor_tag('text', nil, input: 'my-input')).to(
        include('input="my-input"')
      )
    end

    it 'has default classes' do
      expect(helper.trix_editor_tag('text', nil)).to(
        match(/<trix-editor class="formatted_content trix-content"/)
      )
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

    it 'accepts data options' do
      expect(helper.trix_editor_tag('text', nil, data: { coffee: :delicious })).to(
        include('data-coffee="delicious"')
      )
    end

    it 'accepts non-standard options' do
      expect(helper.trix_editor_tag('text', nil, non_standard_option: 2)).to(
        include('non_standard_option="2"')
      )
    end
  end
end
