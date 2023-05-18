# LlamaGPTJ-chat-nix

A Nix flake for gpt4all chat client: https://github.com/kuvaus/LlamaGPTJ-chat

## Running

```
nix --extra-experimental-features nix-command --extra-experimental-features flakes run . -- --model ~/.local/share/nomic.ai/GPT4All/ggml-mpt-7b-chat.bin
```
see the following for more parameters...
```
nix --extra-experimental-features nix-command --extra-experimental-features flakes run . -- --help
```
