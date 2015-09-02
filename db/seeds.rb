# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unit_types = UnitType.create([
	{ name: 'Litros', abbreviation: 'L', metric_system: 'Sistema Metrico Decimal', measure_type: 'Volume', base: 'true' },
	{ name: 'Mililitros', abbreviation: 'ml', metric_system: 'Sistema Metrico Decimal', measure_type: 'Volume', base: 'false' },
	{ name: 'Gramos', abbreviation: 'gr', metric_system: 'Sistema Metrico Decimal', measure_type: 'Weight', base: 'true' },
	{ name: 'Kilogramos', abbreviation: 'kg', metric_system: 'Sistema Metrico Decimal', measure_type: 'Weight', base: 'false' },
	{ name: 'Toneladas', abbreviation: 't', metric_system: 'Sistema Metrico Decimal', measure_type: 'Weight', base: 'false' },
	{ name: 'Milimetros', abbreviation: 'mm', metric_system: 'Sistema Metrico Decimal', measure_type: 'Distance', base: 'false' },
	{ name: 'Centimetros', abbreviation: 'cm', metric_system: 'Sistema Metrico Decimal', measure_type: 'Distance', base: 'false' },
	{ name: 'Metros', abbreviation: 'm', metric_system: 'Sistema Metrico Decimal', measure_type: 'Distance', base: 'true' },
	{ name: 'Kilometros', abbreviation: 'km', metric_system: 'Sistema Metrico Decimal', measure_type: 'Distance', base: 'false' }
	])

