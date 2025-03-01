codesign --force --deep --sign - --entitlements MyLlamaPackage.entitlements .build/arm64-apple-macosx/debug/MyLlamaPackage
codesign --force --deep --sign - --entitlements MyLlamaPackage.entitlements .build/debug/llama.framework

