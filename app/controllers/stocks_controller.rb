require 'ruby-debug'
class StocksController < ApplicationController

  def index
    @stocks = Stock.all
    @quotes = YahooFinance::get_quotes( YahooFinance::StandardQuote, @stocks.map(&:symbol).join(",") )
    @quotes_ext = YahooFinance::get_quotes( YahooFinance::ExtendedQuote, @stocks.map(&:symbol).join(",") )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stocks }
    end
  end

  def show
    @stock = Stock.find(params[:id])

    quotes = YahooFinance::get_quotes( YahooFinance::StandardQuote, @stock.symbol )
    @quote = quotes[@stock.symbol.upcase]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stock }
    end
  end

  def new
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stock }
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def create
    @stock = Stock.new(params[:stock])

    respond_to do |format|
      if @stock.save
        format.html { redirect_to(@stock, :notice => 'Stock was successfully created.') }
        format.xml  { render :xml => @stock, :status => :created, :location => @stock }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stock.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @stock = Stock.find(params[:id])

    respond_to do |format|
      if @stock.update_attributes(params[:stock])
        format.html { redirect_to(@stock, :notice => 'Stock was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stock.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to(stocks_url) }
      format.xml  { head :ok }
    end
  end

  def watch
    @stock = Stock.find(params[:id])
    UserStock.create(:user_id => current_user.id, :stock_id => @stock.id)
    flash[:notice] = "Stock was added to your watch list"
    redirect_to stocks_path 
  end

end
