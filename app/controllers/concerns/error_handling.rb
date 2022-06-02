module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def route_not_found
      render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end

    private

    def not_found(exception)
      logger.warn exception
      render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end
  end
end