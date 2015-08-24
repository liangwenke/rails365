require 'rails_helper'

RSpec.describe Photo, type: :model do
  let (:photo) { FactoryGirl.create(:photo) }

  subject { photo }

  it { should respond_to(:article) }

  describe "所属文章必须存在" do
    before { photo.article = nil }
    it { should_not be_valid }
  end
end
