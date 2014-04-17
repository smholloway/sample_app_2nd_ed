class ToopherTerminalsController < ApplicationController
  # GET /toopher_terminals/new
  # GET /toopher_terminals/new.json
  def new
    @toopher_terminal = ToopherTerminal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @toopher_terminal }
    end
  end

  # POST /toopher_terminals
  # POST /toopher_terminals.json
  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      @toopher_terminal = ToopherTerminal.new(:terminal_name => params[:terminal_name])
      @toopher_terminal.user = @user
      if cookies[:toopher]
        @toopher_terminal.cookie_value = cookies[:toopher]
      else
        @toopher_terminal.cookie_value = SecureRandom.hex(32).to_s
        cookies[:toopher] = @toopher_terminal.cookie_value
      end
      @toopher_terminal.save
      render :json => { :terminal => @toopher_terminal.cookie_value }
    else
      render :json => { :errors => @toopher_terminal.errors, status: :unprocessable_entity }
    end
  end
end
