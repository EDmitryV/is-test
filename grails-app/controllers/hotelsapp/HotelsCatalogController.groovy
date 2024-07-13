package hotelsapp

import grails.gorm.PagedResultList
import grails.gorm.transactions.Transactional

class HotelsCatalogController {
    CountryService countryService
    HotelService hotelService
    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index(int page) {
        if(page == 0) page = 1
        List<Country> countries = countryService.findAll()
        PagedResultList<Hotel> hotels = hotelService.search("", null, page)
        respond([countries:countries, hotels:hotels, page:page, count:hotels.getTotalCount()])
    }

    @Transactional
    def update(Hotel hotel) {
        Hotel preHotel = hotelService.findById(hotel.id)
        Country country = preHotel.country
        if(country.id != hotel.country.id){
            country.removeFromHotels(preHotel)
        }
        hotelService.save(hotel)
        redirect action: 'index', method: 'GET'
    }

    @Transactional
    def save(Hotel hotel) {
        hotelService.save(hotel)
        redirect action: 'index', method: 'GET'
    }

    @Transactional
    def delete(Hotel hotel) {
        hotelService.delete(hotel)
        redirect action:'index', method:'GET'
    }
}
