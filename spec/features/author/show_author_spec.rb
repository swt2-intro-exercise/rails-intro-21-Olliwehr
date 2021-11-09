require 'rails_helper'

describe "Show Author Page", type: :feature do
  it "should display author's details" do
    author_details = create(:author)
    visit author_path(author_details)

    expect(page).to have_text author_details.first_name
    expect(page).to have_text author_details.last_name
    expect(page).to have_text author_details.homepage
  end
end
