@reset-schema
Feature: As an API user
  I can register a user

  Scenario Outline: user registration
    Given I prepare a POST request on "/users/registration"
    And I specified the following request data:
      | username | <username>        |
      | password | <password>        |
      | email    | <email>           |
    When I send the request
    Then I should receive a <response_code> response
    And the response should contains the following json:
      """
      <message>
      """

    Examples:
      | username | password | email                    | response_code | message                                                                      |
      | Nelio    | foobar   | nelio@ci-tron.org        | 200           | {"message": "Your account was correctly created."}                           |
      | Nelio    | foobar   | nelio2@ci-tron.org       | 400           | {"errors": {"username": [ "Username already in use." ] } }                   |
      | Jacques  | lol      | nelio3@ci-tron.org       | 400           | {"errors": {"password": [ "Password too short" ] } }                         |