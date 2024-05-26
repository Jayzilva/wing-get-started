bring cloud;

let queue = new cloud.Queue();
let bucket = new cloud.Bucket();
let counter = new cloud.Counter();

queue.setConsumer(inflight (body: str): void => {
  let next = counter.inc();
  let key = "key-{next}";
  bucket.put(key, body);
});