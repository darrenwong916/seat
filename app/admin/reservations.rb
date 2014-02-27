ActiveAdmin.register Reservation do

  form do |f|
  f.inputs "Label" do
    f.input :party_size
    f.input :restaurant_id
    # etc
  end
end  

   index do
    column "Scheduled Date", :begin, format: :default
    column "Party Size", :party_size
    column(:server_id) { |x| Server.find(x).name }#, "Server", :server_id #do |id| Server.find(id).name end
    # filter :server_id, as: :check_boxes, collection: proc { Server.all }
    default_actions
   
  end

  controller do
    def permitted_params
      params.permit reservation: [ :begin, :end, :party_size, :restaurant_id, :server_id, :tables, :image_file_size ]
    end
  end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
