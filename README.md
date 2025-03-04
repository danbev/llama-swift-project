## Example Swift project
This repo contains an example Swift project that demonstrates how to use the
Swift Package Manager with llama.cpp. 

### building
```console
$ swift build
Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build complete! (0.06s)
```

### Running
```console
$ swift run
Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build complete! (0.06s)
Testing llama integration
Llama context params initialized:
n_ctx: 512
n_threads: 4
start: 15817954819679
```

### Debugging
This is mainly to show that debug symbols for llama.cpp are available:
```console
$ lldb ./.build/debug/MyLlamaPackage
(lldb) target create "./.build/debug/MyLlamaPackage"
Current executable set to '/Users/danbev/work/swift/MyLlamaPackage/.build/debug/MyLlamaPackage' (arm64).
(lldb) br set -f main.swift -l 5
Breakpoint 1: where = MyLlamaPackage`MyLlamaPackage_main + 252 at main.swift:5:14, address = 0x0000000100002078
(lldb) r
Process 35507 launched: '/Users/danbev/work/swift/MyLlamaPackage/.build/debug/MyLlamaPackage' (arm64)
Testing llama integration
Process 35507 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
    frame #0: 0x0000000100002078 MyLlamaPackage`MyLlamaPackage_main at main.swift:5:14
   2
   3     print("Testing llama integration")
   4
-> 5     let params = llama_context_default_params()
   6     print("Llama context params initialized:")
   7     print("n_ctx: \(params.n_ctx)")
   8     print("n_threads: \(params.n_threads)")
Target 0: (MyLlamaPackage) stopped.
(lldb) n
Process 35507 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = step over
    frame #0: 0x00000001000021a0 MyLlamaPackage`MyLlamaPackage_main at main.swift:6:7
   3     print("Testing llama integration")
   4
   5     let params = llama_context_default_params()
-> 6     print("Llama context params initialized:")
   7     print("n_ctx: \(params.n_ctx)")
   8     print("n_threads: \(params.n_threads)")
   9     let start = ggml_time_us()
Target 0: (MyLlamaPackage) stopped.
(lldb) p params
(llama_context_params) {
  n_ctx = 512
  n_batch = 2048
  n_ubatch = 512
  n_seq_max = 1
  n_threads = 4
  n_threads_batch = 4
  rope_scaling_type = .LLAMA_ROPE_SCALING_TYPE_UNSPECIFIED
  pooling_type = .LLAMA_POOLING_TYPE_UNSPECIFIED
  attention_type = .LLAMA_ATTENTION_TYPE_UNSPECIFIED
  rope_freq_base = 0
  rope_freq_scale = 0
  yarn_ext_factor = -1
  yarn_attn_factor = 1
  yarn_beta_fast = 32
  yarn_beta_slow = 1
  yarn_orig_ctx = 0
  defrag_thold = -1
  cb_eval = 0x0000000000000000
  cb_eval_user_data = nil
  type_k = .GGML_TYPE_F16
  type_v = .GGML_TYPE_F16
  logits_all = false
  embeddings = false
  offload_kqv = true
  flash_attn = false
  no_perf = true
  abort_callback = 0x0000000000000000
  abort_callback_data = nil
}
(lldb)
```
