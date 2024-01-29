class WidgetsController < ApplicationController


    # GET /widgets
    def index
      @widgets = Widget.all
      render json: @widgets
    end

    # GET /widget/1
    def show
      render json: @widget
    end

    # POST /widgets
    def create
      @widget = Widget.new(widget_params)

      if @widget.save
        render json: @widget, status: :created, location: @widget
      else
        render json: @widget.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /widget/1
    def update
      set_widget
      data_sent = JSON.parse(request.raw_post())

      @widget.status = data_sent['status']
      @widget.description = data_sent['description']

      if @widget.update(widget_params)
        render json: @widget
      else
        render json: @widget.errors, status: :unprocessable_entity
      end
    end

    # DELETE /widget/1
    def destroy
      set_widget
      @widget.destroy
    end

    private

    def set_widget
      @widget = Widget.find(params[:id])
    end

    def widget_params
      params.permit(:id, :name, :status, :description, :created_at, :updated_at, :widget)
    end    
end
