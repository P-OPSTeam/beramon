# Monitoring stack for Berachain

## Description
This Monitoring stack has been built to monitor your berachain validator node.

It is comprised of :
- grafana for the viewing logs and dashboards
- node_exporter to monitor your host
- prometheus to capture the metrics
- loki to aggregate logs
- promtail to send beacond, reth and system logs to loki
- alertmanager configured with pagerduty

## Prereq

- Reth Execution client
  - configured with systemd
  - metrics enabled `--metrics=0.0.0.0:6060`
- beacond
  - configured with systemd
  - prometheus metrics enabled on port 26660

- Docker

```bash
# install docker / docker-compose
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-compose docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER #you need to logout and login back after that
```

## Installing the stack

### Clone the repo

```bash
git clone https://github.com/P-OPSTeam/beramon
cd beramon
```

### Update start.sh

- update the admin/password of your grafana instance
- Next, If you wanna be alerted, you will need to create an account on pagerduty and get your integration key https://support.pagerduty.com/docs/services-and-integrations

> alertmanager container will fail to start if the PD integration key is not filled up


### Start the stack

```bash
bash start.sh
```

### Check the documentation

- [Grafana documentation](docs/grafana.md)

## TODO

- [ ] Add support for other EL


