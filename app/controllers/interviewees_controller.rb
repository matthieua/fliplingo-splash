class IntervieweesController < ApplicationController
  def new
    @interviewee = Interviewee.new twitter_handle: params[:username]
  end

  def create
    interviewee = Interviewee.new interviewee_params

    render :json => { :created => interviewee.save }
  end

  private

  def interviewee_params
    params.permit(:interviewee => [ :email, :twitter_handle ])[:interviewee]
  end
end
