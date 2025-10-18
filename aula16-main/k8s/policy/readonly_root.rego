package main

deny contains msg if {
  container := input.spec.template.spec.containers[_]
  # Verifica se o campo 'securityContext' existe e se 'readOnlyRootFilesystem' é falso/não está definido.
  # Usamos 'not' para a negação. O 'not' aqui já funciona bem com o comportamento padrão do Rego.
  not container.securityContext.readOnlyRootFilesystem
  msg := sprintf("Container '%s' deve usar readOnlyRootFilesystem: true", [container.name])
}

