class Backoffice::SendMailController < ApplicationController
  def edit
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.js # Responde a chamadas JS
    end
  end

  def create
    AdminMailer.send_message(current_admin, params[:'recipient-text'], params[:'subject-text'], params[:'message-text']).deliver_now

    respond_to do |format|
      format.js # Responde a chamadas JS
    end
  end
end
