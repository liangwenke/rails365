require 'rails_helper'

RSpec.describe Article, type: :model do

  let (:article) { FactoryGirl.create(:article) }

  subject { article }

  it { should respond_to(:title) }

  describe "标题不能为空" do
    before { article.title = "" }
    it { should_not be_valid }
  end

  describe "内容不能为空" do
    before { article.body = "" }
    it { should_not be_valid }
  end
end
