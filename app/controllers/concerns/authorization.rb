module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized(exception)
      if exception.message.present?
        message = exception.message
      else
        message = "Для здійснення цієї дії треба авторизуватись."
      end

      redirect_to(request.referrer || root_path, alert: message)
    end
  end
end