class TimetablesController < InheritedResources::Base

  def index
    @timetables = Timetable.for_front
  end

  private

    def timetable_params
      params.require(:timetable).permit(:position, :title, :code)
    end
end

