# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super

    resource.save
    group = Group.create(group_leader_customer_id: resource.id)
    resource.update(group_id: group.id)
    categories = MasterCategory.all
    livingwares = MasterLivingware.all
    categories.each do |c|
      Category.create(group_id: group.id, name: c.name)
    end
    livingwares.each do |l|
      Livingware.create(category_id: Category.find_by(group_id: group.id, name: MasterCategory.find(l.master_category_id).name).id, group_id: group.id, name: l.name)
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

    protected
  
    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:group_id])
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
    def after_sign_in_path_for(resource)
      categories_path
    end

    def after_sign_out_path_for(resource)
      root_path
    end
  
end
