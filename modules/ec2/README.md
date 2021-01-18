## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | IAM role description | `any` | n/a | yes |
| inline\_policies | A list of IAM policy ARNs to copy inline to the role | `list(string)` | `[]` | no |
| name | IAM role name | `any` | n/a | yes |
| path | The path applied to the IAM role | `string` | `"/"` | no |
| permissions\_boundary | ARN of a permissions boundary policy | `any` | `null` | no |
| policies | A list of IAM policy ARNs to attach to the role | `list(string)` | `[]` | no |
| principal\_roles | Additional IAM roles granted assume role permissions | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn | n/a |
| role\_name | n/a |

