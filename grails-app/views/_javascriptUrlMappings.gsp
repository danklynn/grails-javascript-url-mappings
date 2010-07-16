<script type="text/javascript">
if (typeof(g) === 'undefined' || !g) {
  var g = {};
}

function findBestMatch(controller, action) {
  var mappings = <%=mappings%>;

  for (var i=0; i < mappings.length; ++i) {
    if (mappings[i].controller == controller && mappings[i].action == action) {
      return mappings[i].url;
    }
  }

  return "${appRoot}" + controller + "/";
};

g.createLink = function(options) {
  var controller = options.controller;
  var action = options.action;
  var absolute = options.absolute || false;
  var params = options.params || {};

  //todo: var url = options.url
  //todo var mapping = options.mapping
  //todo absolute mappings

  var keyPairs = [];
  for (var key in params) {
    keyPairs.push(encodeURIComponent(key) + "=" + encodeURIComponent(params[key]));
  }

  return findBestMatch(controller, action) + (keyPairs.length ? "?" + keyPairs.join('&') : '');
};
</script>