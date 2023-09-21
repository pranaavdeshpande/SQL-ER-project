SELECT m.model, 
	   b.brand, 
	   comp.company, 
	   c.date_of_purchase, 
	   c.license_plate, 
	   cl.color, 
	   c.km_total, 
	   ic.insurance_company, 
	   i.insurance_number
	FROM carolina_graciolli_siqueira.companies AS comp
	JOIN carolina_graciolli_siqueira.brands AS b ON comp.id_company = b.id_company
	JOIN carolina_graciolli_siqueira.models AS m ON b.id_brand = m.id_brand
	JOIN carolina_graciolli_siqueira.cars AS c ON m.id_model = c.id_model
	JOIN carolina_graciolli_siqueira.colors AS cl ON c.id_color = cl.id_color
	JOIN carolina_graciolli_siqueira.insurances AS i ON i.id_car = c.id_car
	JOIN carolina_graciolli_siqueira.insurance_companies AS ic ON i.id_insurance_company = ic.id_insurance_company
