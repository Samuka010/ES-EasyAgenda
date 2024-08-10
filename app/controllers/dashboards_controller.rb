class DashboardsController < ApplicationController
    def show
      @events = Event.order(:started_at).as_json(only: [:id, :name, :started_at, :finished_at])
    end
end
