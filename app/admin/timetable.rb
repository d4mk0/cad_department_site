ActiveAdmin.register Timetable do

  permit_params do
    permitted = [:title, :code, :position, :published]
  end

  config.sort_order = 'position_asc'
  config.paginate   = false

  sortable

  index do
    selectable_column
    sortable_handle_column
    column :title
    column :published
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :code, as: :ckeditor
      f.input :published
    end
    f.actions
  end

end
