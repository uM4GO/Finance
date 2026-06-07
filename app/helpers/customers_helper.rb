module CustomersHelper
	def customer_kind_options
		Customer.kinds.map do |key, _value|
			translation_text = t("activerecord.attributes.customer.enums.kind.#{key}")	
			[translation_text, key]
		end
	end
end
