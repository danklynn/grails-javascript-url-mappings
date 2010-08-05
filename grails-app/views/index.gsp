<%--
 Copyright 2010 Dan Lynn

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
 --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Test Runner</title>
    <style type="text/css">
      .pass {color: green;}
      .fail {color: red;}
    </style>
    <g:urlMappings />
  </head>
  <body>
    <script type="text/javascript">
      /*
            Super lightweight jUnit-style testing harness.
           */

      function pass(name) {
        document.write('<div class="pass">' + name + '</div>');
      }

      function fail(name, message) {
        document.write('<div class="fail">' + name + ': ' + message + '</div>');
      }

      var Assert = {
        equals : function(expected, actual, message) {
          if (expected != actual) {
            throw 'Expected "' + expected + '", but got "' + actual + '".' + (message ? ' ' + message : '');
          }
        }
      };
      var tests = {
        createLink_draws_id : function() {
          var expected = "${createLink(controller: 'a', action: 'one', params: [id: '3', key: 'value'])}";
          var actual = g.createLink({
                      controller: 'a',
                      action: 'one',
                      params: {
                        id: 3,
                        key: 'value'
                      }});

          Assert.equals(expected, actual);
        },

        createLink_without_id : function() {
          var expected = "${createLink(controller: 'a', action: 'one', params: [key: 'value'])}";
          var actual = g.createLink({
                      controller: 'a',
                      action: 'one',
                      params: {
                        key: 'value'
                      }});

          Assert.equals(expected, actual);
        },

        createLink_just_controller : function() {
          var expected = "${createLink(controller: 'a')}";
          var actual = g.createLink({controller: 'a'});

          Assert.equals(expected, actual);
        },

        resource_with_dir_and_file: function() {
          Assert.equals(
                  '${resource(dir: 'aDir', file: 'aFile.txt')}',
                  g.resource({dir: 'aDir', file: 'aFile.txt'})
          );
        },

        resource_only_dir: function() {
          Assert.equals(
                  '${resource(dir: 'aDir')}',
                  g.resource({dir: 'aDir'})
          );
        },

        resource_only_file: function() {
          Assert.equals(
                  '${resource(file: 'aFile.txt')}',
                  g.resource({file: 'aFile.txt'})
          );
        },

        resource_dir_only_slash: function() {
          Assert.equals(
                  '${resource(dir: '/')}',
                  g.resource({dir: '/'})
          );
        },

        resource_file_only_slash: function() {
          Assert.equals(
                  '${resource(file: '/')}',
                  g.resource({file: '/'})
          );
        }

      }

      for (var test in tests) {
        try {
          tests[test]();
          pass(test);
        } catch (error) {
          fail(test, error);
        }
      }
    </script>
  </body>
</html>