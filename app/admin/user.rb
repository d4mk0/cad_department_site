ActiveAdmin.register User do

  permit_params do
    permitted = [:email, :first_name, :last_name, :patronymic, :admin]
  end

  index do
    selectable_column
    column :email
    column :last_name
    column :first_name
    column :patronymic
    column :admin
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end

  filter :email
  filter :admin
  filter :last_name
  filter :first_name
  filter :patronymic

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :last_name
      f.input :first_name
      f.input :patronymic
      f.input :admin
    end
    f.actions
  end
end
