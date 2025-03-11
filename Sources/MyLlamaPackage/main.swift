import Foundation
import llama

enum LlamaError: Error {
    case couldNotLoadModel
}

print("Testing llama integration")


let start = ggml_time_us()
print("start: \(start)")

let gguf_ctx = gguf_init_empty()

llama_backend_init()
print("Load model...")
let path = "microsoft_Phi-4-mini-instruct-Q4_K_L.gguf"
var model_params = llama_model_default_params()
model_params.n_gpu_layers = 99;
let model = llama_model_load_from_file(path, model_params)
guard let model else {
    print("Could not load model at \(path)")
    throw LlamaError.couldNotLoadModel
}
print("Model loaded n_cxt_trained: ", llama_model_n_ctx_train(model))

let bufferSize = 1024
let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: bufferSize)
let result = llama_model_desc(model, buffer, bufferSize)
buffer.deallocate()

let modelDesc = String(cString: buffer)
print("Model description: \(modelDesc)")

let params = llama_context_default_params()
print("n_ctx: \(params.n_ctx)")
print("n_threads: \(params.n_threads)")

let chessNotationRegex = """
root    ::= "1. " move " " move "\\n" ([1-9] [0-9]? ". " move " " move "\\n")+
move    ::= (pawn | nonpawn | castle) [+#]?
nonpawn ::= [NBKQR] [a-h]? [1-8]? "x"? [a-h] [1-8]
pawn    ::= ([a-h] "x")? [a-h] [1-8] ("=" [NBKQR])?
castle  ::= "O-O" "-O"?
"""
let sampler = llama_sampler_init_grammar(llama_model_get_vocab(model),
                          chessNotationRegex,
                          "root");

if let cString = llama_sampler_name(sampler) {
    let samplerName = String(cString: cString)
    print("Sampler name: \(samplerName)")
} else {
    print("No sampler name available")
}


llama_model_free(model)
