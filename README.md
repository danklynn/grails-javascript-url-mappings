A Grails plugin to provide client-side reverse URL mappings outside of GSP files.
Just put one taglib call in your layout and your static javascript files can make use of Grails' UrlMappings

#### Example usage (jQuery)

    <g:urlMappings />
    <script type="text/javascript">
    var url = g.createLink({controller: 'news', action: 'fetch', params: {since: new Date()}});
    $('#myDiv').load(url);
    </script>

#### Current Status

Currently reverse-maps all controllers and actions by name only, and handles params as a simple querystring.

#### TODOs

* Get project under jvm-level test
* Get project under functional test to test javascript
* Add support for named mappings
* Add support for mapping wildcards to reverse-map params (e.g. "controller/action?/id?")
* Support the "url" attribute of createLink
* Support absolute urls

#### Contributors

* Dan Lynn - [http://github.com/danklynn/](http://github.com/danklynn/)
