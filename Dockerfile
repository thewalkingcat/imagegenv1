# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.5-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found.
# Could not resolve unknown_registry node: CheckpointLoaderSimple (no aux_id provided in workflow metadata)

# download models into comfyui
# RUN comfy model download --url "https://civitai.com/api/download/models/2411065?type=Model&format=SafeTensor&size=full&fp=fp16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "mldmd2.safetensors"
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget -q -O "models/unet/anima-turbo-v1.0.safetensors" "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/diffusion_models/anima-turbo-v1.0.safetensors" && \
    wget -q -O "models/vae/qwen_image_vae.safetensors" "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/vae/qwen_image_vae.safetensors" && \
    wget -q -O "models/clip/qwen_3_06b_base.safetensors" "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/text_encoders/qwen_3_06b_base.safetensors" && \
    wget -q -O "models/upscale_models/4x-AnimeSharp.pth" "https://huggingface.co/Kim2091/AnimeSharp/resolve/main/4x-AnimeSharp.pth"

RUN comfy model download --url "https://civitai.com/api/download/models/2485296?type=Model&format=SafeTensor&size=full&fp=bf16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "NetaYumeLuminaV4.0.safetensors"
# RUN comfy model download --url "https://civitai.com/api/download/models/3004959?type=Model&format=SafeTensor&size=full&fp=bf16" --set-civitai-api-token "00d4f9d5da710441e457df098bcb0386" --relative-path "models/checkpoints" --filename "milkydreamsdmd2.safetensors"
# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
