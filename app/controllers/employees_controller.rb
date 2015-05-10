class EmployeesController < InheritedResources::Base

  def index
    @employees = Employee.for_front
  end

  private

    def employee_params
      params.require(:employee).permit(:full_name, :photo, :post, :academic_degree, :academic_title, :description, :published, :position)
    end
end

