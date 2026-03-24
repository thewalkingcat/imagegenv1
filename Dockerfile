# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.5-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found.
# Could not resolve unknown_registry node: CheckpointLoaderSimple (no aux_id provided in workflow metadata)

# download models into comfyui
RUN comfy model download --url "https://civitai.com/api/download/models/2578565?type=Model&format=SafeTensor&size=pruned&fp=fp16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "Jankuv6.9.safetensors"
RUN comfy model download --url "https://civitai.com/api/download/models/2615702?type=Model&format=SafeTensor&size=pruned&fp=fp16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "hassakuXLIllustrious_v34.safetensors"
# RUN comfy model download --url "https://civitai.com/api/download/models/2672638?type=Model&format=SafeTensor&size=full&fp=fp16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "AnimayhemV3.0.safetensors"

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
