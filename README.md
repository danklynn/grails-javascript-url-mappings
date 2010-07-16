A Grails plugin to provide client-side reverse URL mappings.

#### Example usage (jQuery)

    var url = g.createLink({controller: 'news', action: 'fetch', params: {since: new Date()}});
    $('#myDiv').load(url);

#### Current Status

Currently reverse-maps all controllers and actions by name only, and handles params as a simple querystring.

#### TODOs

* Get project under jvm-level test
* Get project under functional test to test javascript
* Add support for named mappings
* Add support for mapping wildcards to reverse-map params (e.g. "controller/action?/id?")

#### Contributors

* Dan Lynn - [http://github.com/danklynn/](http://github.com/danklynn/)
