require 'comment'

RSpec.describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      link = Link.create(url: 'http://www.testlink.com')
      comment = Comment.create(link_id: link.id, text: 'My comment here')

      expect(comment.id).not_to be_nil
    end
  end
end