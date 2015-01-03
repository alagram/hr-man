def set_current_user
  roy = Fabricate(:employee)
  session[:emp_id] = roy.id
end

def set_super_user(super_user = nil)
  session[:emp_id] = (super_user || Fabricate(:super_user)).id
end
