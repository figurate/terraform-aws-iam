# ![AWS](aws-logo.png) IAM Role

Purpose: Provision IAM Role in AWS.

Rationale: Apply standards and constraints to IAM Roles.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | IAM role description | `any` | n/a | yes |
| inline\_policies | A list of IAM policy ARNs to copy inline to the role | `list(string)` | `[]` | no |
| name | IAM role name | `any` | n/a | yes |
| path | The path applied to the IAM role | `string` | `"/"` | no |
| permissions\_boundary | ARN of a permissions boundary policy | `any` | `null` | no |
| policies | A list of IAM policy ARNs to attach to the role | `list(string)` | `[]` | no |
| principal | Identifier for the role principal | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn | n/a |
| role\_name | n/a |

