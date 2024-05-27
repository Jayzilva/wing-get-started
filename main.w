bring cloud;

let api = new cloud.Api();
let queue = new cloud.Queue();
let bucket = new cloud.Bucket();
let counter =  new cloud.Counter(initial : 1);
  

api.post("/inc", inflight (req)=>{
  counter.inc();
  queue.push("Message {counter.peek()}");
  return cloud.ApiResponse {status: 200, body: "Counter incremented"};
  });

api.post("/dec", inflight (req)=>{
  counter.dec();
  queue.push("Message {counter.peek()}");
  return cloud.ApiResponse {status: 200};
});

queue.setConsumer(inflight (message)=>{
  bucket.put(message, "Hello {counter.peek()}");
});


