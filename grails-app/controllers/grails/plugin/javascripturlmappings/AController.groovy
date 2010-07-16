package grails.plugin.javascripturlmappings

class AController {

    def one = { }
    def two = { }

    def three() {
        // not a closure
    }

    private def four = {
        // a private closure
    }
}
