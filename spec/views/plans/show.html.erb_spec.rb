require 'rails_helper'

RSpec.describe "plans/show", type: :view do
  before(:each) do
    @plan = assign(:plan, Plan.create!(
      :name => "Name",
      :company_ids => 2,
      :greenhouse_ids => 3,
      :user_ids => 4,
      :users_allowed => 5,
      :companies_allowed => 6,
      :greenhouses_allowed => 7,
      :cost_per_month_usd => 8.5,
      :billing => "Billing"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/Billing/)
  end
end
