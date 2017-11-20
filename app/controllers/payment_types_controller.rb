class PaymentTypesController < ApplicationController
    include SessionsHelper

    def new
        @payment_type = PaymentType.new

    end
    
    def create
        @payment_type = PaymentType.new(payment_type_params)
        if @payment_type.save
          flash[:success] = "New Payment was created!"
          redirect_to profile_path
        else
          render 'new'
        end
    end


    def destroy
        @payment = PaymentType.find(params[:id])
        @payment.destroy
        redirect_to profile_path
    end

    private
    
      def payment_type_params
        params.require(:payment_type).permit(:user_id, :account_name,    
                                        :account_number, :exp_date)
    
      end
end
