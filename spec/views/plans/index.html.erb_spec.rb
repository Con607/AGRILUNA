require 'rails_helper'

RSpec.describe "plans/index", type: :view do
  before(:each) do
    assign(:plans, [
      Plan.create!(
        :name => "Name",
        :company_ids => 2,
        :greenhouse_ids => 3,
        :user_ids => 4,
        :users_allowed => 5,
        :companies_allowed => 6,
        :greenhouses_allowed => 7,
        :cost_per_month_usd => 8.5,
        :billing => "Billing"
      ),
      Plan.create!(
        :name => "Name",
        :company_ids => 2,
        :greenhouse_ids => 3,
        :user_ids => 4,
        :users_allowed => 5,
        :companies_allowed => 6,
        :greenhouses_allowed => 7,
        :cost_per_month_usd => 8.5,
        :billing => "Billing"
      )
    ])
  end

  it "renders a list of plans" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.5.to_s, :count => 2
    assert_select "tr>td", :text => "Billing".to_s, :count => 2
  end
end
