 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/papers", type: :request do
  
  # Paper. As you add validations to Paper, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      :title => "Valid paper title",
      :venue => "Valid venue location",
      :year => 1999
    }
  }

  let(:invalid_attributes) {
    {
      :title => "",
      :venue => "",
      :year => ""
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Paper.create! valid_attributes
      get papers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      paper = Paper.create! valid_attributes
      get paper_url(paper)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_paper_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      paper = Paper.create! valid_attributes
      get edit_paper_url(paper)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Paper" do
        expect {
          post papers_url, params: { paper: valid_attributes }
        }.to change(Paper, :count).by(1)
      end

      it "redirects to the created paper" do
        post papers_url, params: { paper: valid_attributes }
        expect(response).to redirect_to(paper_url(Paper.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Paper" do
        expect {
          post papers_url, params: { paper: invalid_attributes }
        }.to change(Paper, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post papers_url, params: { paper: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          :title => "New paper title",
          :venue => "New venue location",
          :year => 2000
        }
      }

      it "updates the requested paper" do
        paper = Paper.create! valid_attributes
        patch paper_url(paper), params: { paper: new_attributes }
        paper.reload
        expect(paper.title).to eq new_attributes.values_at(:title).first
        expect(paper.venue).to eq new_attributes.values_at(:venue).first
        expect(paper.year).to eq new_attributes.values_at(:year).first
      end

      it "redirects to the paper" do
        paper = Paper.create! valid_attributes
        patch paper_url(paper), params: { paper: new_attributes }
        paper.reload
        expect(response).to redirect_to(paper_url(paper))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        paper = Paper.create! valid_attributes
        patch paper_url(paper), params: { paper: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested paper" do
      paper = Paper.create! valid_attributes
      expect {
        delete paper_url(paper)
      }.to change(Paper, :count).by(-1)
    end

    it "redirects to the papers list" do
      paper = Paper.create! valid_attributes
      delete paper_url(paper)
      expect(response).to redirect_to(papers_url)
    end
  end
end
