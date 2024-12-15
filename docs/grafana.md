# Grafana

## What it is ?

Grafana open source software enables you to query, visualize, alert on, and explore your metrics, logs, and traces wherever they are stored.

## Login to the grafana page

Obtain the IP of your grafana stack (usually your validator ip), access by browsing http://grafana_stack_ip:3000

Grafana will then load and will present you with the login page

![Grafana login screen](img/grafana-login.png?raw=true "Grafana login screen")

Enter the username and password as previously defined in `start.sh`

You will then be on the Grafana welcome page

![Grafana welcome](img/grafana-welcome.png?raw=true "Grafana welcome")

## Open a dashboard

Open the menu by clicking `3 lines` on the top left, then click on `Dashboards` (4 squares), then open click on `Cosmos/Tendermint Network dashboard`

You will then be able to see your validator dashboard :

![Validator dashboard](img/grafana-dashboard.png?raw=true "Validator dashboard")

## Accessing your validator logs (loki)

Open the menu by clicking `3 lines` on the top left, then click on `Explore`, on top click `Prometheus` and change it to `Loki`

![Grafana explore](img/grafana-explore.png?raw=true "Grafana explore")

you should now be able to use the `builder` to select a label (ie `systemd_unit`) and the value ie `beacond.service` then click on the `Run Query` to see the logs

Below an example with the logs of the loki container

![Grafana logs](img/grafana-logs.png?raw=true "Grafana logs")

> Note that logs rely on another component of the stack called promtail and is used to send the logs to loki. Feel free to checkout `promtail.yaml` configuration file if you wish to add more logs

## What about the alerts ?

Open the menu by clicking `3 lines` on the top left, go in the `Alerting` section (`bell` icon) and click `Alert rules`

![Grafana Alert](img/grafana-alerts.png?raw=true "Grafana Alert")

> Free to navigate into all the defined rules which you can find the same under the conf/prometheus/rules folder

Feel free to explore the other dashboard and ask us any questions. You can reach out to us on discord https://discord.gg/jRAmy7uS8v or telegram https://t.me/POPS_Team_Validator

