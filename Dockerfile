# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.5-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found.
# Could not resolve unknown_registry node: CheckpointLoaderSimple (no aux_id provided in workflow metadata)

# download models into comfyui
RUN comfy model download --url "https://civitai.com/api/download/models/2786084" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "JANKUTrainedChenkinNoobai_v777.safetensors"
RUN comfy model download --url "https://civitai.com/api/download/models/2485296?type=Model&format=SafeTensor&size=full&fp=bf16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "NetaYumeLuminaV4.0.safetensors"

RUN comfy model download --url "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/text_encoders/qwen_3_06b_base.safetensors" --relative-path models/clip --filename "qwen_3_06b_base.safetensors"
RUN comfy model download --url "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/vae/qwen_image_vae.safetensors" --relative-path models/vae --filename "qwen_image_vae.safetensors"
RUN comfy model download --url "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/diffusion_models/anima-preview3-base.safetensors" --relative-path models/diffusion_models --filename "anima-preview3.safetensors"
# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
