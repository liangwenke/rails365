require 'rails_helper'

RSpec.describe Group, type: :model do
  let (:group) { FactoryGirl.create(:group) }

  subject { group }

  it { should respond_to(:name) }

  describe "when name is no present" do
    before { group.name = "" }
    it { should_not be_valid }
  end
end
