package py.org.presidencia



import grails.test.mixin.*
import spock.lang.*

@TestFor(SubMenuController)
@Mock(SubMenu)
class SubMenuControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.subMenuInstanceList
            model.subMenuInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.subMenuInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def subMenu = new SubMenu()
            subMenu.validate()
            controller.save(subMenu)

        then:"The create view is rendered again with the correct model"
            model.subMenuInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            subMenu = new SubMenu(params)

            controller.save(subMenu)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/subMenu/show/1'
            controller.flash.message != null
            SubMenu.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def subMenu = new SubMenu(params)
            controller.show(subMenu)

        then:"A model is populated containing the domain instance"
            model.subMenuInstance == subMenu
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def subMenu = new SubMenu(params)
            controller.edit(subMenu)

        then:"A model is populated containing the domain instance"
            model.subMenuInstance == subMenu
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/subMenu/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def subMenu = new SubMenu()
            subMenu.validate()
            controller.update(subMenu)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.subMenuInstance == subMenu

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            subMenu = new SubMenu(params).save(flush: true)
            controller.update(subMenu)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/subMenu/show/$subMenu.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/subMenu/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def subMenu = new SubMenu(params).save(flush: true)

        then:"It exists"
            SubMenu.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(subMenu)

        then:"The instance is deleted"
            SubMenu.count() == 0
            response.redirectedUrl == '/subMenu/index'
            flash.message != null
    }
}
