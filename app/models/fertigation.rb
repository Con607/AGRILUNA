class Fertigation < ActiveRecord::Base
	belongs_to :greenhouse
	has_many :fertigation_items, dependent: :destroy

	# IMPLEMENTACION DE FERTIRRRIGACION POR TANQUE DE SOLUCION MADRE QUEDA PENDIENTE
end
