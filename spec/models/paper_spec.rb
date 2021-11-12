require 'rails_helper'

describe Paper, type: :model do
  let(:paper) { create :paper }

  it "should have (empty) list with associated authors" do
    expect(paper.authors).to be_empty
  end
end
