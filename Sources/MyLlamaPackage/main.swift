import llama

print("Testing llama integration")

let params = llama_context_default_params()
print("Llama context params initialized:")
print("n_ctx: \(params.n_ctx)")
print("n_threads: \(params.n_threads)")
let start = ggml_time_us()
print("start: \(start)")

let gguf_ctx = gguf_init_empty()
