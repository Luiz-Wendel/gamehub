class Site::Profile::AdsController < Site::ProfileController
  def index
    @ads = Ad.to_member(current_member)
  end
end
