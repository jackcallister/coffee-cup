require 'spec_helper'

describe Post do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:administrator) }

  it { should belong_to(:administrator) }

  describe "#author" do
    let(:administrator) { build(:administrator) }
    subject { build(:post, administrator: administrator) }
    its(:author) { should eq administrator.username }
  end
end
