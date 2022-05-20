class Admin::HomesController < ApplicationController
    
    def top
        @inquiries = Inquiry.page(params[:page]).per(10).order(created_at: :desc)
    end
    
end
