require 'rails_helper'

RSpec.describe "plans/edit", type: :view do
  before(:each) do
    @plan = assign(:plan, Plan.create!(
      :name => "MyString",
      :company_ids => 1,
      :greenhouse_ids => 1,
      :user_ids => 1,
      :users_allowed => 1,
      :companies_allowed => 1,
      :greenhouses_allowed => 1,
      :cost_per_month_usd => 1.5,
      :billing => "MyString"
    ))
  end

  it "renders the edit plan form" do
    render

    assert_select "form[action=?][method=?]", plan_path(@plan), "post" do

      assert_select "input#plan_name[name=?]", "plan[name]"

      assert_select "input#plan_company_ids[name=?]", "plan[company_ids]"

      assert_select "input#plan_greenhouse_ids[name=?]", "plan[greenhouse_ids]"

      assert_select "input#plan_user_ids[name=?]", "plan[user_ids]"

      assert_select "input#plan_users_allowed[name=?]", "plan[users_allowed]"

      assert_select "input#plan_companies_allowed[name=?]", "plan[companies_allowed]"

      assert_select "input#plan_greenhouses_allowed[name=?]", "plan[greenhouses_allowed]"

      assert_select "input#plan_cost_per_month_usd[name=?]", "plan[cost_per_month_usd]"

      assert_select "input#plan_billing[name=?]", "plan[billing]"
    end
  end
end
