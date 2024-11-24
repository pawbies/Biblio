class SessionsController < ApplicationController
  def login
  end

  def login_verify
    @librarian = Librarian.find_by(email: params[:email])

    if @librarian.present? && @librarian.authenticate(params[:password])
      session[:librarian_id] = @librarian.id
      redirect_to root_path, notice: "Erfolgreich als #{@librarian.firstname} #{@librarian.lastname} eingelogt"
    else
      flash.now[:alert] = "Falsche Email oder Passwort"
      render :login, status: :unprocessable_entity, notice: "Wrong email or password"
    end
  end

  def logout
    Current.librarian = nil
    session[:librarian_id] = nil
    redirect_to root_path, notice: "Abgemeldet"
  end
end
