package hotelsapp

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class CountriesCatalogControllerSpec extends Specification implements ControllerUnitTest<CountriesCatalogController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test index action"() {
        when:
        controller.index()

        then:
        status == 200
        response.text == 'Hello, World!'
    }
}
