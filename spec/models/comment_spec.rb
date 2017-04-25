require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:wikip) { Wikip.create!(title: "New Post Title", body: "New Post Body") }
  let(:comment) { Comment.create!(body: 'Comment Body', wikip: wikip) }

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end
end
