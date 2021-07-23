class DashboardController < ApplicationController
    def index
        @markers = Marker.all.order(name: :desc)
        @categories = Category.all.order(name: :desc)

    end
end