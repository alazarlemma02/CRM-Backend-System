# frozen_string_literal: true

module Common # rubocop:disable Style/Documentation
  extend ActiveSupport::Concern

  included do
    before_action :set_clazz
    before_action :set_object, only: %i[show update destroy]
  end

  def index
    data = if block_given?
             yield
           else
             @clazz.all
           end
    render json: { success: true, data: serialize(data) }
  end

  def show
    render json: { success: true, data: serialize(@obj) }
  end

  def create
    obj = if block_given?
            yield
          else
            @clazz.new(model_params)
          end

    if obj.save
      render json: { success: true, data: serialize(obj) }, status: :created
    else
      render json: { success: false, error: obj.errors.full_messages[0] }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { success: false, error: e.message }
  end

  def update
    obj = if block_given?
            yield
          else
            @obj
          end
    if obj.update(model_params)
      render json: { success: true, data: serialize(obj) }
    else
      render json: { success: false, error: obj.errors.full_messages[0] }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { success: false, error: e.message }
  end

  def destroy
    @obj.destroy
  end

  private

  def set_clazz
    @clazz = controller_name.classify.constantize
  end

  def set_object
    @obj = @clazz.find(params[:id])
  end

  def serialize(obj)
    ActiveModelSerializers::SerializableResource.new(obj)
  end

  # This class should be overridden by respective child controllers
  def model_params; end
end
