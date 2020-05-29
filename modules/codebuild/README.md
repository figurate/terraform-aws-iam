## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | IAM role description | `any` | n/a | yes |
| name | IAM role name | `any` | n/a | yes |
| path | The path applied to the IAM role | `string` | `"/"` | no |
| policies | A list of IAM policy ARNs to attach to the role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| role\_name | n/a |

