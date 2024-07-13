package hotelsapp

class Hotel {
    String name
    Country country
    int stars
    String website

    static belongsTo = [ country: Country ]

    static constraints = {
        name maxSize: 255, blank: false, validator: { val, obj, errors ->
            def results = this.findAllByCountryIlikeAndNameIlike(country, name)
            if(results) {
                errors.rejectValue('name', 'unique.name')
                return false
            }
            return true
        }
        country blank: false
        stars blank: false, range: 1..5
        website blank: true, url: true
    }
}
