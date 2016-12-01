class Product < ApplicationRecord
	has_attached_file :image, styles:{large:"600x600>", medium: "300x300>", thumb: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

#validaciones
    validates :title, presence: { message: "Ingrese un nombre"}
    validates :title, uniqueness: {case_sensitive: false ,message: "Este nombre ya esta registrado"}
    validates :price, presence: { message: "Ingrese un precio"}
    validates :price, numericality: { only_integer: true }
    validates :description, presence: { message: "Ingrese una descripcion"}
end
