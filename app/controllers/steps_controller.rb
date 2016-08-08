class StepsController < ApplicationController
  skip_before_action :check_user_plan, only: [:first]

  layout 'static_pages'

  def first
  end

  def second
  end

  def third
  end

  def fourth
  end

  def finish
  end
end
 