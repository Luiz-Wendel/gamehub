class AdminMailer < ApplicationMailer

  def update_email(current_admin, admin, saved_admin_name)
    @current_admin = current_admin
    @admin = admin
    @saved_admin_name = saved_admin_name
    mail(to: @admin.email, subject: "Seus dados foram alterados!")
  end

end
