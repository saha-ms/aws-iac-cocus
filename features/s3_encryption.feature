Feature: Enforce S3 encryption
  Scenario: Ensure all S3 buckets have encryption enabled
    Given I have aws_s3_bucket defined
    Then it must contain server_side_encryption_configuration
    