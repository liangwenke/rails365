class Admin::ExceptionLogsController < Admin::BaseController
  before_action :set_admin_exception_log, only: [:show, :destroy]

  def index
    @admin_exception_logs = Admin::ExceptionLog.order("id DESC").page(params[:page]).per(20)
  end

  def show
  end

  def destroy
    @admin_exception_log.destroy
    respond_to do |format|
      format.html { redirect_to admin_exception_logs_url, notice: 'Exception log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    Admin::ExceptionLog.delete(params[:admin_exception_log_ids])
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_exception_log
      @admin_exception_log = Admin::ExceptionLog.find(params[:id])
    end
end
