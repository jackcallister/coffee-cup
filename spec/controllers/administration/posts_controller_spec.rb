require 'spec_helper'

describe Administration::PostsController do

  let(:administrator) { create(:administrator) }
  let(:post_record) { create(:post) }

  # This should return the minimal set of attributes required to create a valid
  # ProductLandingPage. As you add validations to ProductLandingPage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:post).merge(administrator_id: administrator.id) }
  let(:invalid_attributes)  { { title: "Test Post", body: "Test body" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductLandingPagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    sign_in :administrator, administrator
  end

  describe "GET index" do

    it "assigns all posts as @posts" do
      get :index, {}, valid_session
      assigns(:posts).should eq([post_record])
    end
  end

  describe "GET new" do

    it "assigns a new article as @article" do
      get :new, {}, valid_session
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "POST create" do

    context "with valid attributes" do
      it "creates a new post" do
        expect {
          post :create, { post: valid_attributes }, valid_session
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
          post :create, { post: invalid_attributes }, valid_session
        }.to change(Post, :count).by(0)
      end
      it "renders the new action" do
        post :create, { post: invalid_attributes }, valid_session
        response.should render_template :new
      end
    end
  end
end
