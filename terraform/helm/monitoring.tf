resource "helm_release" "monitoring" {
    name             = var.monitoring_release_name
    repository       = var.monitoring_chart_repository
    chart            = var.monitoring_chart_name
    version          = var.monitoring_chart_version
    namespace        = var.monitoring_namespace
    create_namespace = var.monitoring_create_namespace
    wait_for_jobs    = var.monitoring_wait_for_jobs
    timeout          = var.monitoring_install_timeout
    # set {
    #   name = "prometheusSpec.replicas"
    #   value = "2"
    # }
}

# resource "helm_release" "prometheus" {
#     name             = var.prometheus_release_name
#     repository       = var.monitoring_chart_repository
#     chart            = var.prometheus_chart_name
#     version          = var.prometheus_chart_version
#     namespace        = var.monitoring_namespace
#     create_namespace = var.monitoring_create_namespace
#     # wait_for_jobs    = var.monitoring_wait_for_jobs
#     # timeout          = var.monitoring_install_timeout
#     depends_on = [
#       helm_release.monitoring
#     ]
#     set {
#         name  = "alertmanager.enabled"
#         value = "false"
#     }
    
#     set {
#       name  = "prometheus-node-exporter.enabled"
#       value = "false"
#     }

#     set{
#         name = "prometheus-pushgateway.enabled"
#         value = "false"
#     }

#     set{
#         name = "kube-state-metrics.enabled"
#         value = "false"
#     }
#     set {
#       name = "scrape_configs.job_name"
#       value = "druid_exporter"
#     }

#     set {
#       name = "scrape_config.static_configs.targets.druid-exporter-prometheus-druid-exporter.druid-raw.svc"
#       value = "8080"
#     }
# }