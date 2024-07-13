package hotelsapp

import grails.gorm.PagedResultList
import grails.gorm.transactions.ReadOnly
import grails.gorm.transactions.Transactional

@Transactional
class HotelService {
    Hotel save(String name,
               Country country,
               int stars,
               String website) {
        Hotel hotel = new Hotel(name: name,
                country: country,
                stars: stars,
                website: website)
        hotel.save(flush:true)
        hotel
    }
    Hotel save(Hotel hotel) {
        if (hotel == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (hotel.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond hotel.errors, view: 'edit'
            return
        }
        hotel.save(flush: true)
        hotel
    }

    def delete(Hotel hotel) {
        if (hotel == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        hotel.delete(flush: true)
    }
    @ReadOnly
    PagedResultList<Hotel> search(String query, Country country, int page) {
        def c = Hotel.createCriteria()
        c.list (max: 10, offset: (page-1)*10) {
            if(country != null) eq("country", country)
            if(!query.isEmpty()) like("name", "%$query%")
            order("stars", "desc")
            order("name", "asc")
        }
    }
    @ReadOnly
    Hotel findById(Long id) {
        Hotel.get(id)
    }
}
