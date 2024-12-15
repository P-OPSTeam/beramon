global:
  scrape_interval: 10s
  scrape_timeout: 3s
  evaluation_interval: 5s

# Rules and alerts are read from the specified file(s)
rule_files:
  - rules/alert.rules.yaml
  - rules/berachain.rules.yaml

# Alerting specifies settings related to the Alertmanager
alerting:
  alertmanagers:
    - static_configs:
      - targets:
        - alertmanager:9093

scrape_configs:
  - job_name: berachain
    static_configs:
      - targets: ['PUBLIC_IP:26660']
    metric_relabel_configs: &ignore_unwanted_metrics # need to define the relabel config on the first scrape_config
      - source_labels: [__name__]
        regex: "^(go_|python_|process_).*"
        action: drop

  - job_name: 'berachain_reth'
    metrics_path: /debug/metrics/prometheus
    static_configs:
      - targets: ['PUBLIC_IP:6060']
    metric_relabel_configs: *ignore_unwanted_metrics

  - job_name: node
    static_configs:
      - targets: ['PUBLIC_IP:9100']
    metric_relabel_configs: *ignore_unwanted_metrics

  - job_name: prometheus
    static_configs:
      - targets: ['localhost:9090']
    metric_relabel_configs: *ignore_unwanted_metrics

  - job_name: cadvisor
    static_configs:
      - targets: ['cadvisor:8080']
    metric_relabel_configs: *ignore_unwanted_metrics


