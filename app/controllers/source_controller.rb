class SourceController < ApplicationController
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def show
      @all_sources = Source.all.order(:name)
      @user_sources = @all_sources.where(user_id: current_user.id)
      # if show route has a hidden parameter

      if params[:id] != "show"
        @change_source = Source.find_by_id(params[:id])
        if @change_source.user_id == nil
          @change_source.update(user_id: current_user.id)
        else
          @change_source.update(user_id: nil)
        end
        # update/reload same page
        redirect_to :back
      end
  end
end
