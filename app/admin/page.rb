ActiveAdmin.register Page do

  permit_params do
    permitted = [:title, :text, :published, :permalink]
  end

  index do
    column :title
    column :permalink
    column :published
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :permalink
      f.input :published
      f.input :text, as: :ckeditor
    end
    f.actions
  end

  show do |page|
    attributes_table do
      row :title
      row :permalink
      row :published
      row :text do
        page.text.html_safe
      end
      row :created_at
      row :updated_at
    end
  end

end
