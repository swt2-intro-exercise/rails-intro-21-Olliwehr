require 'rails_helper'

describe "Paper index page", type: :feature do
  before :each do
    @papers = [create(:paper)]
  end

  it "can be specified with a year" do
    @papers.push(Paper.new(title: 'Kein Text zum Anzeigen', venue: 'hier', year: 2000))

    visit papers_path(:year => 1999)

    expect(page).to have_text @papers.first.title
    expect(page).to_not have_text @papers.second.title
  end
end