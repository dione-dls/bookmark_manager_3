require 'tag'

RSpec.describe Tag do
  describe '.create' do
    it 'creates a new tag' do
      tag = Tag.create(content: 'Test Tag')

      expect(tag.id).not_to be_nil
    end
  end
end