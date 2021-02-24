from diagrams import Diagram
from diagrams.aws.security import IAMRole, IAMPermissions

with Diagram("AWS IAM Role", show=False, direction="TB"):

    IAMRole("iam role") << [IAMPermissions("inline policies"), IAMPermissions("attached policies")]
