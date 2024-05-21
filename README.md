# crac-test

### Step 1: Checkpoint

From within the `crac-test` folder, you have the choice to run
either [on demand checkpoint/restore of a running application](https://docs.spring.io/spring-framework/reference/6.1/integration/checkpoint-restore.html#_on_demand_checkpointrestore_of_a_running_application)
with:

```
./checkpoint.sh
```

Or to run
an [automatic checkpoint/restore at startup](https://docs.spring.io/spring-framework/reference/6.1/integration/checkpoint-restore.html#_automatic_checkpointrestore_at_startup)
with:

```
./checkpointOnRefresh.sh
```

### Step 2: Restore

Restore the application with:

```
./restore.sh
```
