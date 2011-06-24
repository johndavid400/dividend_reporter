class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :new, :create]

  def index
    @users = User.all
    @user = current_user.id
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show

    @stocks = current_user.stocks
    @quotes = YahooFinance::get_quotes( YahooFinance::StandardQuote, @stocks.map(&:symbol).join(",") )
    @quotes_ext = YahooFinance::get_quotes( YahooFinance::ExtendedQuote, @stocks.map(&:symbol).join(",") )
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(:users, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def unwatch
    @stock = Stock.find(params[:id])
    u = UserStock.find_by_user_id_and_stock_id(current_user.id, @stock.id)
    u.destroy
    flash[:notice] = "Stock was removed from your watch list"
    redirect_to user_path(current_user)
  end

end
