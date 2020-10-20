package disallowedNamespaces

violation[{"msg": msg}] {
  spec := input.review.object
  disallowed := { spec.metadata.namespace == input.parameters.namespaces[_]}
  any(disallowed)
  msg := sprintf("<%v> has an invalid namespace <%v>, disallowed namespaces are %v", [spec.metadata.name, spec.metadata.namespace, input.parameters.namespaces])
}
