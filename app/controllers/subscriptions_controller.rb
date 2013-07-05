class SubscriptionsController < ApplicationController

  def create
    subscription = MailingListSubscription.new(params[:email],params[:list_id])
    subscription.subscribe
    respond_to do |format|
      format.json { render json: { data: {}, errors: subscription.errors }, status: subscription.code.nil? ? :ok : :unprocessable_entity }
    end
  end

end