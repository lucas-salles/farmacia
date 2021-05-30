# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
    {
        name: 'Fitoterápico'
    },
    {
        name: 'Alopático'
    },
    {
        name: 'Homeopático'
    },
    {
        name: 'Similar'
    },
    {
        name: 'Genérico'
    },
    {
        name: 'Referência'
    },
    {
        name: 'Manipulado'
    }
])

Medicament.create([
    {
        name: 'Paracetamol',
        description: 'Descrição qualquer',
        price: 2,
        category_id: 5
    },
    {
        name: 'Dipirona',
        description: 'Descrição qualquer',
        price: 2,
        category_id: 5
    }
])
