ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :phone_number
    column :created_at
    actions
  end

  filter :full_name
  filter :email
  filter :created_at

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |c|
        if c.image.attached?
          image_tag url_for(c.image.variant(resize_to_limit: [ 300, 300 ]))
        end
      end
    end
  end
end
