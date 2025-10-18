package main

deny contains msg if {
    resource := input.resource_changes[_]
    resource.type == "aws_security_group"
    ingress_rule := resource.change.after.ingress[_]
    ingress_rule.from_port == 22
    ingress_rule.protocol == "tcp"
    ingress_rule.cidr_blocks[_] == "0.0.0.0/0"
    msg := sprintf("Falha de segurança: O recurso '%s' expõe a porta SSH (22) publicamente (0.0.0.0/0), o que não é permitido.", [resource.name])
}

