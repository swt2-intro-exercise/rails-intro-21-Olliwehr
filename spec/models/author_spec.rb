require 'rails_helper'

describe Author, type: :model do
  let(:author) { create(:author) }

  it "should have attributes for the author's first name, last_name and homepage" do
    expect(author.first_name).to eq 'Alan'
    expect(author.last_name).to eq 'Turing'
    expect(author.homepage).to eq 'http://wikipedia.org/Alan_Turing'
  end

  it "should have a name method that combines the first name and the last name" do
    expect(author.name).to eq 'Alan Turing'
  end

  it "should require a set last name" do
    invalid_author = Author.new(first_name: 'Alan', homepage: 'http://wikipedia.org/Alan_Turing')
    expect(invalid_author).to be_invalid
  end

  it "should have (empty) list with associated papers" do
    expect(author.papers).to be_empty
  end
end
