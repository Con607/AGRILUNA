

def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.account.plan.nil?
      '/steps/first'
    else
      super
    end
end