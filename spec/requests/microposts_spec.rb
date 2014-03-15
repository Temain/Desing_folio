require 'spec_helper'

describe "Microposts" do
  describe "microposts page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }

    describe "microposts" do
      #it { should have_content(m1.content) }
      #it { should have_content(m2.content) }
      #it { should have_content(user.microposts.count) }
    end
  end
end
