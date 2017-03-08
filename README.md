# vrops2datadog

App to send datapoint from VMware vRealize Operation Manager (vrops) to datadog

### How to run:

* Update configuration file (config/config.yml)

   * to get adpterKind: curl "api/adapterkinds/" -k
   * to get resourcesKindKey with adapterKind: curl "https://<you_vrop_hostname>/api/adapterkinds/<adapterKindKey>/resources"
   * to get statKey: curl "https://<you_vrop_hostname>/api/adapterkinds/<adapterKindKey>/resourcekinds/<resourceKindKey>/statkeys"

```
---

vrops_auth:
- hostname: somthing.vrops.domain.com
  username: username
  password: shouldchangeit

# Replace adapterKind key
adapterKind:
- VMware

resources:
- name: riakcs
  resourceKindKey: LUN
  statKey:
  - perf|write_iops
  - perf|read_iops
  - perf|percent_busy
  
```

* Run App:
```
bundle install
rackup
```
