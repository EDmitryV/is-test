package hotelsapp

import grails.gorm.transactions.ReadOnly
import grails.gorm.transactions.Transactional

@Transactional
class CountryService {
    Country save(String name, String capital) {
        Country country = new Country(name: name, capital: capital)
        country.save(flush: true)
        country
    }

    Country save(Country country) {
        if (country == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (country.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond country.errors, view: 'edit'
            return
        }
        country.save(flush: true)
        country
    }

    def delete(Country country) {
        if (country == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        country.delete(flush: true)
    }

    @ReadOnly
    List<Country> findAll() {
        Country.findAll()
    }

    @ReadOnly
    Country findById(Long id) {
        Country.get(id)
    }
}
