class RoomsController < ApplicationController
    before_action :find_room, only: [:show, :edit, :update, :destroy]
    def index
    end

    def home
        @rooms = Room.all.order("created_at DESC") 
    end

    def show
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @room.update(room_params)
            redirect_to room_path(@room)
        else
            render 'edit'
        end
    end

    def destroy
        @room.destroy
        redirect_to root_path
    end

    private

    def  room_params
        params.require(:room).permit(:title, :max_occupancy)
    end

    def find_room
        @room = Room.find(params[:id])
    end
end
