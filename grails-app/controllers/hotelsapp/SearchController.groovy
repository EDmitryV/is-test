package hotelsapp

import grails.gorm.PagedResultList

class SearchController {

    CountryService countryService
    HotelService hotelService

    def index() {
        List<Country> countries = countryService.findAll()
        respond([countries:countries])
    }

    def search(String query, Long countryId, int page){
        if(page == 0) page = 1
        Country country = countryService.findById(countryId)
        List<Country> countries = countryService.findAll()
        PagedResultList<Hotel> hotels = hotelService.search(query, country, page)
        respond([count:hotels.getTotalCount(), hotels:hotels, page:page, countryId:countryId, query:query, countries: countries])
    }
}
