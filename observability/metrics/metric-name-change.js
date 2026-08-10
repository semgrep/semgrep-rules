// Test file for metric-name-change rule
// This file contains test cases with true positives and true negatives

// ===== TRUE POSITIVES (should trigger the rule) =====

// ruleid: observability.metrics.metric-name-change
metrics.counter("user_login_count", 1);

// ruleid: observability.metrics.metric-name-change
prometheus.Counter({name: "http_requests_total", help: "Total HTTP requests"});

// ruleid: observability.metrics.metric-name-change
statsd.increment("page_views", 1);

// ruleid: observability.metrics.metric-name-change
statsd.counter("api_calls", 5);

// ruleid: observability.metrics.metric-name-change
client.increment("user_registrations", 1, {tags: ["success"]});

// ruleid: observability.metrics.metric-name-change
meter.counter("database_queries", queryCount);

// ===== TRUE NEGATIVES (should NOT trigger the rule) =====

// ok: observability.metrics.metric-name-change
const userCount = 42;

// ok: observability.metrics.metric-name-change
logger.info("User logged in successfully");

// ok: observability.metrics.metric-name-change
const metricName = "user_login_count";

// ok: observability.metrics.metric-name-change
console.log("Processing metrics");

// ok: observability.metrics.metric-name-change
function incrementCounter(name, value) {
  return name + value;
}

// ok: observability.metrics.metric-name-change
db.query("SELECT COUNT(*) FROM users");

// ok: observability.metrics.metric-name-change
const config = {
  metrics: {
    enabled: true,
    port: 9090
  }
};

// ok: observability.metrics.metric-name-change
// This is just a comment about metrics.counter("test")

// ok: observability.metrics.metric-name-change
const obj = {
  counter: function(name) { return name; }
};