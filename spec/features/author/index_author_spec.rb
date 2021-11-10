require 'rails_helper'

describe "Index author page", type: :feature do
  before :each do
    @author = create(:author)
  end

  it "should contain a table with author's details" do
    visit authors_path

    expect(page).to have_selector 'th', text: 'Name'
    expect(page).to have_selector 'th', text: 'Homepage'

    expect(page).to have_text @author.name
    expect(page).to have_link nil, href: @author.homepage
  end

  it "should have link to new author page" do
    visit authors_path

    expect(page).to have_link 'Create a new author', href: new_author_path
  end

  it "should contain link to delete the author" do
    visit authors_path

    expect(page).to have_link 'Delete', href: author_path(@author)
  end

  it "should delete the author on clicking the delete link" do
    visit authors_path

    find('a[data-method="delete"]', text: 'Delete').click

    expect(Author.exists?(first_name: @author.first_name, last_name: @author.last_name, homepage: @author.homepage)).to be_falsey
  end
end
