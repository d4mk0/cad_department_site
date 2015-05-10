ActiveAdmin.register Employee do

  permit_params do
    permitted = [:full_name, :photo, :post, :academic_degree, :academic_title, :description, :published, :position]
  end

  config.sort_order = 'position_asc'
  config.paginate   = false

  sortable

  index do
    selectable_column
    sortable_handle_column
    column :full_name
    column :post
    column :published
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :photo
      f.input :post
      f.input :academic_degree
      f.input :academic_title
      f.input :description, as: :ckeditor
      f.input :published
      f.input :contact_details
    end
    f.actions
  end


end
