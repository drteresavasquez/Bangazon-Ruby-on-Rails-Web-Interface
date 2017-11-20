class PaymentTypesController < ApplicationController
    include SessionsHelper

    def new
        @payment_type = PaymentType.new
        @payment_types = PaymentType.all.map {|c| c.account_name}.uniq!

    end



    
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
