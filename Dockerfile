# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.5-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found.
# Could not resolve unknown_registry node: CheckpointLoaderSimple (no aux_id provided in workflow metadata)

# download models into comfyui
RUN comfy model download --url "https://civitai.com/api/download/models/2786084" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "JANKUTrainedChenkinNoobai_v777.safetensors"
RUN comfy model download --url "https://civitai.com/api/download/models/2485296?type=Model&format=SafeTensor&size=full&fp=bf16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "NetaYumeLuminaV4.0.safetensors"
RUN comfy model download --url "https://civitai.red/api/download/models/2851312?type=Model&format=SafeTensor&size=full&fp=bf16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "AnimayumeV0.4.safetensors"
# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
