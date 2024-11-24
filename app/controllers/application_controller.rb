class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_librarian

  private

  def set_current_librarian
    Current.librarian = Librarian.find_by(id: session[:librarian_id]) unless session[:librarian_id].nil?
  end

  def require_librarian!
    redirect_to root_path, alert: "Nicht befugt" unless Current.librarian.present?
  end
end
