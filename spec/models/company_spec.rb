require 'rails_helper'



RSpec.describe Company, type: :model do

	describe "creation" do

		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_presence_of(:description) }
		it { is_expected.to validate_presence_of(:address) }
		it { is_expected.to validate_presence_of(:telephone) }

		it { should validate_uniqueness_of(:name) }

		it { should validate_numericality_of(:telephone) }

		context "valid attributes" do
			it "should be valid" do
    		  company = FactoryGirl.build(:company)
    		  company.should be_valid
    		end
		end

		context "invalid attributes" do
			it "should not be valid" do
    		  company = FactoryGirl.build(:company, name: "")
    		  company.should_not be_valid
    		end
	    end

	end

end


