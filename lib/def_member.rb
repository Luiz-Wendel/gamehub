module CurrentMember
  def self.included(base)
    base.send :helper_method, :current_user
  end
end