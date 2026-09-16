# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.5-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found.
# Could not resolve unknown_registry node: CheckpointLoaderSimple (no aux_id provided in workflow metadata)

# download models into comfyui
# RUN comfy model download --url "https://civitai.red/api/download/models/2967640?fileId=2847103&token=00d4f9d5da710441e457df098bcb0386" --relative-path "models/diffusion_models" --filename "Janima.Safetensors"
# RUN comfy model download --url "https://civitai.red/api/download/models/2485296?fileId=2373765&token=00d4f9d5da710441e457df098bcb0386" --relative-path "models/diffusion_models" --filename "NetaYumeLuminaV4.0.safetensors"
# RUN comfy model download --url "https://civitai.red/api/download/models/3065644?fileId=2944325&token=00d4f9d5da710441e457df098bcb0386" --relative-path "models/diffusion_models" --filename "AnimaYumev10.safetensors"
RUN comfy model download --url "https://civitai.red/api/download/models/3136969?fileId=3017009&token=00d4f9d5da710441e457df098bcb0386" --relative-path "models/diffusion_models" --filename "waianimaturbo.safetensors"
RUN comfy model download --url "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/vae/qwen_image_vae.safetensors" --relative-path "models/vae" --filename "qwen_image_vae.safetensors"
RUN comfy model download --url "https://huggingface.co/Kim2091/AnimeSharp/resolve/main/4x-AnimeSharp.pth" --relative-path "models/upscale_models" --filename "4x-AnimeSharp.pth"
RUN comfy model download --url "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/text_encoders/qwen_3_06b_base.safetensors" --relative-path "models/text_encoders" --filename "qwen_3_06b_base.safetensors"
# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed) 2485296
# COPY input/ /comfyui/input/
