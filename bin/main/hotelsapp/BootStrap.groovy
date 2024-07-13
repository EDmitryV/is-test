package hotelsapp

class BootStrap {
    HotelService hotelService
    CountryService countryService
    def assetResourceLocator

    def init = { servletContext ->
        File file = new File(this.class.classLoader.getResource("country-list.csv").file)
        def rows = file.readLines().tail()*.replaceAll("\"","")*.split(',')

        ArrayList<Country> countries = []
        rows.each {value ->
            Country country = countryService.save(value[0], value[1])
            countries.add(country)
        }
        file = new File(this.class.classLoader.getResource("hotels-list.csv").file)
        rows = file.readLines().tail()*.split('(?:,|\\n|^)("(?:(?:"")*[^"]*)*"|[^",\\n]*|(?:\\n|$))')
        for(int i = 0; i < rows.size(); i++){
            String[] row = rows.get(i)
            println(row)
            hotelService.save(row[0],countries.get(i%countries.size()), row[1] as int, row[2])
        }
    }
    def destroy = {
    }
}
