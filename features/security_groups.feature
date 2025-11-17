Feature: Enforce secure security group rules

  Scenario: Ensure only approved ports are open
    Given I have aws_security_group defined
    Then it must contain ingress
    And its ingress must contain protocol "tcp"
    And its ingress must contain from_port 443
    And its ingress must contain to_port 443
    And its ingress must contain cidr_blocks "0.0.0.0/0"

  Scenario: Ensure SSH access is controlled
    Given I have aws_security_group defined
    Then it must contain ingress
    And its ingress must contain from_port 22
    And its ingress must contain to_port 22
    And its ingress must contain protocol "tcp"
    And its ingress must contain cidr_blocks "0.0.0.0/0"

  Scenario: Ensure outbound traffic is allowed
    Given I have aws_security_group defined
    Then it must contain egress
    And its egress must contain protocol "-1"
    And its egress must contain cidr_blocks "0.0.0.0/0"
    