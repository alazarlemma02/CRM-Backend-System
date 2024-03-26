# frozen_string_literal: true

class UsersController < ApplicationController
  include Common

  private

  def model_params
    params.require(:payload).permit(:first_name, :last_name, :email, :phone_number, :profile_picture, :password_digest,
                                    :address_id, :role_id, :user_type, :date_of_birth, :user_name)
  end
end
