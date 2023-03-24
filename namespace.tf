data "kubectl_file_documents" "namespaces" {
  content = file("${path.module}/k8s/namespaces.yaml")
}

resource "kubectl_manifest" "namespaces" {
  count     = length(data.kubectl_file_documents.namespaces.documents)
  yaml_body = element(data.kubectl_file_documents.flux.documents, count.index)
}
