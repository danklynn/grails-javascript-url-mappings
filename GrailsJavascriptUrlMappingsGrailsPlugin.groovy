import org.springframework.beans.BeanWrapper
import org.springframework.beans.PropertyAccessorFactory
import grails.plugin.javascripturlmappings.AllMappingsHolder


class GrailsJavascriptUrlMappingsGrailsPlugin {
    // the plugin version
    def version = "0.1"
    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "1.2.2 > *"
    // the other plugins this plugin depends on
    def dependsOn = [:]
    // resources that are excluded from plugin packaging
    def pluginExcludes = [
            "grails-app/views/error.gsp",
            "grails-app/controllers/**"
    ]

    // TODO Fill in these fields
    def author = "Dan Lynn"
    def authorEmail = "dan@danlynn.com"
    def title = "A Grails plugin to provide client-side reverse URL mappings."
    def description = '''\\
Brief description of the plugin.
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/grails-javascript-url-mappings"

    def doWithWebDescriptor = { xml ->
        // TODO Implement additions to web.xml (optional), this event occurs before 
    }

    def doWithSpring = {
        def controllers = findAllControllers(application)

        allMappingsHolder(AllMappingsHolder) {
            delegate.controllers = controllers 
        }
    }

    def findAllControllers(application) {
        application.controllerClasses.collect {c ->
            [
                name: "${c.logicalPropertyName}",
                actions: PropertyAccessorFactory.forBeanPropertyAccess(c.newInstance()).propertyDescriptors.collect {
                            c.getPropertyOrStaticPropertyOrFieldValue(it.name, Closure) ? it.name : null
                        }.findAll {it != null}
            ]
        }
    }

    def doWithDynamicMethods = { ctx ->
        // TODO Implement registering dynamic methods to classes (optional)
    }

    def doWithApplicationContext = { applicationContext ->
    }

    def onChange = { event ->
        // TODO Implement code that is executed when any artefact that this plugin is
        // watching is modified and reloaded. The event contains: event.source,
        // event.application, event.manager, event.ctx, and event.plugin.
    }

    def onConfigChange = { event ->
        // TODO Implement code that is executed when the project configuration changes.
        // The event is the same as for 'onChange'.
    }
}
