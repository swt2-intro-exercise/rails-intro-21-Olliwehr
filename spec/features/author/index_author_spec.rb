require 'rails_helper'

describe "Index author page", type: :feature do
  it "should contain a table with author's details" do
    author = create(:author)

    visit authors_path

    expect(page).to have_selector 'th', text: 'Name'
    expect(page).to have_selector 'th', text: 'Homepage'

    expect(page).to have_text author.name
    expect(page).to have_link nil, href: author.homepage
  end

  it "should have link to new author page" do
    visit authors_path

    expect(page).to have_link 'Create a new author', href: new_author_path
  end
end
