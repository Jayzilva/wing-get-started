"use strict";
const $helpers = require("@winglang/sdk/lib/helpers");
module.exports = function({ $bucket, $counter }) {
  class $Closure1 {
    constructor({  }) {
      const $obj = (...args) => this.handle(...args);
      Object.setPrototypeOf($obj, this);
      return $obj;
    }
    async handle(body) {
      const next = (await $counter.inc());
      const key = String.raw({ raw: ["key-", ""] }, next);
      (await $bucket.put(key, body));
    }
  }
  return $Closure1;
}
//# sourceMappingURL=inflight.$Closure1-1.cjs.map