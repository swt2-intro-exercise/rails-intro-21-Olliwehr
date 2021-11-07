require 'rails_helper'

describe Author, type: :model do
  it "should have attributes for the author's first name, last_name and homepage" do
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
    expect(author.first_name).to eq 'Alan'
    expect(author.last_name).to eq 'Turing'
    expect(author.homepage).to eq 'http://wikipedia.org/Alan_Turing'
  end

  it "should have a name method that combines the first name and the last name" do
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
    expect(author.name).to eq 'Alan Turing'
  end
end
