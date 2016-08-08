require 'rails_helper'

RSpec.describe Account, type: :model do

	describe "creation" do

		it { is_expected.to validate_presence_of(:user_id) }

		it { should validate_uniqueness_of(:user_id) }

		context "valid attributes" do
			it "should be valid" do
    		  account = FactoryGirl.build(:account)
    		  account.should be_valid
    		end
		end

		context "invalid attributes" do
			it "should not be valid" do
    		  account = FactoryGirl.build(:account, user_id: "")
    		  account.should_not be_valid
    		end
	    end

	end

end
