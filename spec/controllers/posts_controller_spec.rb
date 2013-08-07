require 'spec_helper'

describe PostsController do

  let(:administrator)       { create(:administrator) }
  let(:valid_attributes)    { { title: "Test Post", body: "Test body", administrator_id: administrator.id } }
  let(:invalid_attributes)  { { title: "Test Post", body: "Test body" } }

  describe "POST #create" do

    context "with valid attributes" do
      it "creates a new post" do
        expect {
          post :create, { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end
      it "redirects to the index action" do
        post :create, { post: valid_attributes }
        response.should redirect_to action: 'index', notice: 'Post successfully created'
      end
    end

    context "with invalid attributes" do
      it "does not create a new post" do
        expect {
          post :create, { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end
      it "render the new action" do
        post :create, { post: invalid_attributes }
        response.should render_template :new
      end
    end
  end
end
