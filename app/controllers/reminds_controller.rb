class RemindsController < ApplicationController
  before_action :set_remind, only: [:show, :edit, :update, :destroy, :index]
  before_action :authenticate_user!

  def index
    @reminds=current_user.reminds 
  end

  def show
  end

  def new
    @remind = Remind.new
  end

  def edit
  end
  def create
    @remind = Remind.new(remind_params)
    @remind.user_id=current_user.id
    respond_to do |format|
      if @remind.save
        format.html { redirect_to @remind, notice: 'Remind was successfully created.' }
        format.json { render :show, status: :created, location: @remind }
      else
        format.html { render :new }
        format.json { render json: @remind.errors, status: :unprocessable_entity }
      end
    end
    # Resque.enqueue(RemindEmailWorker, @remind.id)
  end

  def update
    respond_to do |format|
      if @remind.update(remind_params)
        format.html { redirect_to @remind, notice: 'Remind was successfully updated.' }
        format.json { render :show, status: :ok, location: @remind }
      else
        format.html { render :edit }
        format.json { render json: @remind.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @remind.destroy
    respond_to do |format|
      format.html { redirect_to reminds_url, notice: 'Remind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
     def set_remind
      if !Remind.find_by(id: params[:id]).nil?
        @remind = Remind.find(params[:id])
      end
      
    end

    def remind_params
      params.require(:remind).permit(:task, :status, :alarm, :name)
    end  
end
