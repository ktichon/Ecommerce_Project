ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :cost, :author_id, :image, book_genres_attributes: [:id, :book_id, :genre_id, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :cost, :author_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do |book|
    attributes_table do
      row :name
      row :description
      row :author
      row :cost
      row :genres do |book|
        book.genres.map{ |bg| bg.genre_name}.join(", ").html_safe
      end

    end
  end

  form do |f|
    f.semantic_errors
    f.inputs "Book" do
      f.input :name
      f.input :description
      f.input :author
      f.input :cost
      f.has_many :book_genres, allow_destroy: true do |n_f|
        n_f.input :genre
      end
    end
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions
  end

end
