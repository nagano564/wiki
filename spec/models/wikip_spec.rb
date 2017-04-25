require 'rails_helper'

RSpec.describe Wikip, type: :model do
  let(:wikip) {Wikip.create!(title: "New Post Title", body: "New Post Body" )}

  describe "attributes" do
    it "has title and body attributes" do
      expect(wikip).to have_attributes(title: "New Post Title", body: "New Post Body")
    end
  end
end
