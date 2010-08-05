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

  return "${appRoot}" + controller;
};

g.createLink = function(options) {
  var controller = options.controller;
  var action = options.action;
  var absolute = options.absolute || false;
  var params = options.params || {};

  //todo: var url = options.url
  //todo var mapping = options.mapping
  //todo absolute mappings

  var match = findBestMatch(controller, action);
  if (match.match(/__ID__/)) {
    match = match.replace(/\/__ID__/,  params.id ? '/' + params.id :  '');
    delete params['id'];
  }

  var keyPairs = [];
  for (var key in params) {
    keyPairs.push(encodeURIComponent(key) + "=" + encodeURIComponent(params[key]));
  }

  return match + (keyPairs.length ? "?" + keyPairs.join('&') : '');
};

g.resource = function(options) {
  options = options || {};
  var dir = options.dir || '';
  var file = options.file || '';

  var path = '';
  if (dir && file) {
    path = dir + '/' + file;
  } else if (dir) {
    path = dir;
  }  else if (file) {
    path = file;
  }

  return ("${appRoot}" + path).replace(/\/{2}/g, '/');
};
</script>