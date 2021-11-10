require 'rails_helper'

describe "Edit author page", type: :feature do
  new_first_name = 'Ruby'
  new_last_name = '(Programmiersprache)'
  new_homepage = 'https://de.wikipedia.org/wiki/Ruby_%28Programmiersprache%29'

  before :each do
    @author = create(:author)
  end

  it "should exist at 'edit_author_path' and render without error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit edit_author_path(@author)
  end

  it "should have text inputs for an author's first name, last name and homepage" do
    visit edit_author_path(@author)
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field(name: 'author[first_name]')
    expect(page).to have_field(name: 'author[last_name]')
    expect(page).to have_field(name: 'author[homepage]')
  end

  it "should update author's data on submit" do
    visit edit_author_path(@author)
    fill_in 'author[first_name]', with: new_first_name
    fill_in 'author[last_name]', with: new_last_name
    fill_in 'author[homepage]', with: new_homepage

    find('input[type="submit"]').click
    updated_author = @author.reload

    expect(updated_author.first_name).to eq new_first_name
    expect(updated_author.last_name).to eq new_last_name
    expect(updated_author.homepage).to eq new_homepage
  end

  it "should show errors when updating author data with empty last name" do
    visit edit_author_path(@author)
    fill_in 'author[first_name]', with: new_first_name
    fill_in 'author[homepage]', with: new_homepage
    fill_in 'author[last_name]', with: ''

    find('input[type="submit"]').click

    expect(page).to have_text 'error'
  end
end
