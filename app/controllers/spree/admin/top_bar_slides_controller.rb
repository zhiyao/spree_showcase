module Spree
  module Admin
    class TopBarSlidesController < ResourceController
      respond_to :html

      # Copied over from the Spree Core.
      def update_positions
        params[:positions].each do |id, index|
          TopBarSlide.where(:id => id).update_all(:position => index)
        end

        respond_to do |format|
          format.js  { render :text => 'Ok' }
        end
      end

      def index
        @slides = TopBarSlide.recent.all # There is a default_scope order(:position) in effect.
      end

    end
  end
end
