ActiveAdmin.register Team do
  permit_params :name, :description, :logo


  form do |f|
    f.inputs "Team Details" do
      f.input :name
      f.input :description
      f.input :logo, as: :file, required: false
    end
    f.actions
  end
end
