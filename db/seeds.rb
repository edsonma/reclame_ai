require 'bcrypt'

user1 = User.create! email: "laele@edu.co", name: "Baiano Laele", password_digest: BCrypt::Password.create('laele')
user2 = User.create! email: "fernanda@gov.br", name: "Fernanda", password_digest: BCrypt::Password.create('koala')
user3 = User.create! email: "fernandes@gov.br", name: "Fernandes", password_digest: BCrypt::Password.create('jacare')
user4 = User.create! email: "admin@reclameai.com", name: "Adminstrator", password_digest: BCrypt::Password.create('admin')

locale1 = Locale.create! latitude: "-23.5499158", longitude: "-46.6334289", country: "Brazil", city: "Brasilia"
locale2 = Locale.create! latitude: "-15.7627365", longitude: "-47.8886328", country: "Brazil", city: "Brasilia"
locale3 = Locale.create! latitude: "-15.7921100", longitude: "-46.6334289", country: "Brazil", city: "Brasilia"
locale4 = Locale.create! latitude: "-15.8102388", longitude: "-47.97131159", country: "Brazil", city: "Brasilia"


order1 = Order.create! user_id: user1.id, shipping_address: "Praça da Sé Lado Ímpar", shipping_zipcode: "01001000", order_number: "12341234", description: "Primeiro item do pedido", order_date: Time.now.to_i, locale_id: locale1.id
order2 = Order.create! user_id: user1.id, shipping_address: "CLN 202 Bloco B", shipping_zipcode: "70832525", order_number: "12351235", description: "Segundo item do pedido", order_date: Time.now.to_i, locale_id: locale2.id
order3 = Order.create! user_id: user2.id, shipping_address: "SDC (Setor de Difusão Cultural)", shipping_zipcode: "70070350", order_number: "12361236", description: "Primeiro item do pedido", order_date: Time.now.to_i, locale_id: locale3.id
order4 = Order.create! user_id: user3.id, shipping_address: "QE 23 Área Especial s/n Feira do Guará", shipping_zipcode: "71025100", order_number: "123571237", description: "Primeiro item do pedido", order_date: Time.now.to_i, locale_id: locale4.id
order5 = Order.create! user_id: user4.id, shipping_address: "QE 23 Área Especial s/n Feira do Guará", shipping_zipcode: "7102510", order_number: "12381238", description: "Primeiro item do pedido", order_date: Time.now.to_i, locale_id: locale4.id



