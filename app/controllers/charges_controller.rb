class ChargesController < ApplicationController

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge

    @wikis = Wiki.all

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    subscription = Stripe::Subscription.create(
      :customer => customer.id,
      :plan => "premium-monthly"
    )

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    current_user.update_attributes( role: 'premium',
                                    stripe_id: customer.id,
                                    subscription_id: subscription.id)

    redirect_to wikis_path

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path

  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: 20_00
    }
  end

  def destroy


    subscription = Stripe::Subscription.retrieve(current_user.subscription_id)
    subscription.delete(:at_period_end => true)
    current_user.update_attributes(role: 'standard', subscription_id: nil)

    flash[:notice] = "You've cancelled your premium subscription, #{current_user.email}!"
    redirect_to wikis_path
  end
end
