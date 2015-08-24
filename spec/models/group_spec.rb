require 'rails_helper'

RSpec.describe Group, type: :model do
  let (:group) { FactoryGirl.create(:group) }

  subject { group }

  it { should respond_to(:name) }

  describe "名称不能为空" do
    before { group.name = "" }
    it { should_not be_valid }
  end
end
