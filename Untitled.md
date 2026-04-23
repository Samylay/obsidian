![[Pasted image 20260423155326.png]]

  ┌────────────────┬─────────────┬──────────────────────────────────────┐
  │     Metric     │    Value    │            What it means             │
  ├────────────────┼─────────────┼──────────────────────────────────────┤
  │ Request Rate   │ 1.20K req/s │ Handling 1200 requests/second        │
  ├────────────────┼─────────────┼──────────────────────────────────────┤
  │ p99 Latency    │ 446ms       │ 99% of requests under 446ms          │
  ├────────────────┼─────────────┼──────────────────────────────────────┤
  │ Error Rate     │ 0%          │ Zero failures                        │
  ├────────────────┼─────────────┼──────────────────────────────────────┤
  │ Event Loop Lag │ ~22ms       │ Single thread staying responsive     │
  ├────────────────┼─────────────┼──────────────────────────────────────┤
  │ Active Handles │ 73          │ Concurrent connections being managed │
  └────────────────┴─────────────┴──────────────────────────────────────┘

  Key observation for your report: 0% error rate at 1000 VUs — Node.js handles it fine with a single event loop thread, never blocking.
![[Pasted image 20260423160555.png]]