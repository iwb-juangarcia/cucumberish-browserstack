Feature: Smoke check application

  Scenario: Check Alert in the App
    Given User opens the app
    When User perfom alert actions
    Then User closes the app

  Scenario: Check Text in the App
    Given User opens the app
    When User perfom text actions
    Then User closes the app
