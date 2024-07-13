package hotelsapp

class Country {
    String name
    String capital
    static hasMany = [hotels: Hotel]

    static mapping = {
        hotels cascade: 'all-delete-orphan'
    }
    static constraints = {
        name maxSize: 255, blank: false, unique: true
        capital maxSize: 128, blank: false
    }
}
