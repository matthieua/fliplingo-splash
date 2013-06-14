class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    invite = Invite.new invite_params

    render :json => { :created => invite.save }
  end

  private

  def invite_params
    params.permit(:invite => :email)[:invite]
  end
end
