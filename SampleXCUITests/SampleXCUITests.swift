import Foundation
import XCTest



class SampleXCUITests: NSObject {
    public static var app = XCUIApplication()
    
    @objc class func cucumberishSwiftInit() {
        // If tests don't start when rebuilding, use Product -> Test for them to 'load'
        beforeStart { () -> Void in
            self.app = XCUIApplication()
        }
        
        
        Match(["And", "Given", "When", "Then"], "User opens the app") { _, _ in
            app.launch()
        }
        
        Match(["And", "Given", "When", "Then"], "User perfom alert actions") { _, _ in
            // bring up the alert
            app.buttons["Alert"].tap()
            //verify that the alert has come
            XCTAssertEqual(app.alerts.element.label, "Alert")
            //dismiss the alert
            app.alerts.buttons["OK"].tap()
            //verify that the alert is dismissed
            XCTAssertEqual(app.alerts.count, 0)
        }
        
        Match(["And", "Given", "When", "Then"], "User perfom text actions") { _, _ in
            //visit the text page
            app.buttons["Text"].tap()
            let enterText = "Hi Browserstack!!"
            //verify that the text field has come up
            XCTAssert(app.textFields["Enter a text"].exists)
            //write the text
            app.textFields["Enter a text"].tap()
            app.textFields["Enter a text"].typeText(enterText)
            app.typeText("\r")
            //verify that the text entered matches the text view
            XCTAssertEqual(app.staticTexts.element.label, enterText)
        }
        
        Match(["And", "Given", "When", "Then"], "User (closes|terminates) the app") { _, _ in
            app.terminate()
        }
        
        let bundle = Bundle(for: SampleXCUITests.self)

        Cucumberish.instance()?.prettyScenarioNamesAllowed = true
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }
}
