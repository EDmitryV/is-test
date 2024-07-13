package hotelsapp

import grails.gorm.transactions.Transactional

class CountriesCatalogController {
    CountryService countryService
    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index() {
        List<Country> countries = countryService.findAll()

        respond([countries:countries])
    }

    @Transactional
    def update(Country country) {
        countryService.save(country)
        redirect action: 'index', method: 'GET'
    }

    @Transactional
    def save(Country country) {
        countryService.save(country)
        redirect action: 'index', method: 'GET'
    }

    @Transactional
    def delete(Country country) {
        countryService.delete(country)
        redirect action:'index', method:'GET'
    }
}
