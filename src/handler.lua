local host = os.getenv("SPLUNK_HOST") --Ex: gateway-datacenter.company.com

local KongClusterDrain = {}

KongClusterDrain.PRIORITY = 3 --The standard request termination plugin is 2 so we need to run before that and beat it out in priority.
KongClusterDrain.VERSION = "1.0"


function KongClusterDrain:access(conf)

 if conf.hostname == host then --If host has been set check if match and start throwing http status for maintenance
  return kong.response.exit(503, { message = "Scheduled Maintenance" })
 end

 return --If no match on host then just return
end

return KongClusterDrain
