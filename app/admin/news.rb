ActiveAdmin.register News do

  permit_params do
    permitted = [:title, :text, :short_description, :published]
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :published
      f.input :short_description, as: :ckeditor
      f.input :text, as: :ckeditor
    end
    f.actions
  end

  index do
    column :title
    column :published
    column :views
    column :created_at
    column :updated_at
    actions
  end

  show do |news|
    attributes_table do
      row :title
      row :views
      row :published
      row :short_description do
        news.short_description.html_safe
      end
      row :text do
        news.text.html_safe
      end
      row :created_at
      row :updated_at
    end
  end
end
