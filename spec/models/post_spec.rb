require 'spec_helper'

describe Post do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:administrator) }

  it { should belong_to(:administrator) }

  context "#author" do

    it "calls administrator.username" do
      subject.administrator.should_receive(:username)
      subject.author
    end

    it "is the administrator username" do
      subject.administrator.stub(username: "Test Username")
      subject.author.should eq "Test Username"
    end
  end
end
