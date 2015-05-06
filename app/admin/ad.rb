ActiveAdmin.register Ad do

  permit_params :title, :text, :published
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  form do |f|
    f.inputs do
      f.input :title
      f.input :published
      f.input :text, as: :ckeditor
    end
    f.actions
  end

end