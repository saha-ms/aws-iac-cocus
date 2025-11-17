Feature: Enforce tagging standards

  Scenario: All resources must have Environment and Owner tags
    Given I have resource that supports tags
    Then it must contain tags
    And its tags must contain key "Environment"
    And its tags must contain key "Owner"
    