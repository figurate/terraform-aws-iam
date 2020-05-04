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
| name | IAM role name | `any` | n/a | yes |
| path | The path applied to the IAM role | `string` | `"/"` | no |
| policies | A list of IAM policy ARNs to attach to the role | `list(string)` | `[]` | no |
| principal | Identifier for the role principal | `any` | n/a | yes |
| principals | A map of commonly used role principals | `map(list(string))` | <pre>{<br>  "application-autoscaling": [<br>    "application-autoscaling.amazonaws.com",<br>    "Service"<br>  ],<br>  "cloudformation": [<br>    "cloudformation.amazonaws.com",<br>    "Service"<br>  ]<br>}</pre> | no |

## Outputs

No output.

