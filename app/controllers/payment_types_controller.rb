class PaymentTypesController < ApplicationController
    include SessionsHelper


    # @build  instantiates PaymentType object, creates collection of all available payment types
    # @params  none
    # @return  none
    def new
        @payment_type = PaymentType.new
        @payment_types = PaymentType.all.map {|c| c.account_name}.uniq!
    end
    # @build  creates a new payment type
    # @params  params from payment_type#new form
    # @return  redirects to profile_path
    def create
        @payment_type = PaymentType.new(payment_type_params)
        if @payment_type.save
          flash[:success] = "New Payment was created!"
          redirect_to profile_path
        else
          @payment_types = PaymentType.all.map {|c| c.account_name}.uniq!
          render 'new'
        end
    end

    # @build  deletes a payment type from the database
    # @params  id of the payment type
    # @return  redirects to profile_path
    def destroy
        @payment = PaymentType.find(params[:id])
        @payment.destroy
        redirect_to profile_path
    end

    private

      # @build  allows payment type fields to be editable by user
      # @params
      # @return  params
      def payment_type_params
        params.require(:payment_type).permit(:user_id, :account_name,
                                        :account_number, :exp_date)

      end
end
