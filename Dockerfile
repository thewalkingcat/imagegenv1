FROM runpod/worker-comfyui:5.8.5-base

RUN mkdir -p /runpod-volume/models/diffusion_models \
             /runpod-volume/models/vae \
             /runpod-volume/models/upscale_models \
             /runpod-volume/models/text_encoders && \
    rm -rf /comfyui/models/diffusion_models \
           /comfyui/models/vae \
           /comfyui/models/upscale_models \
           /comfyui/models/text_encoders && \
    ln -s /runpod-volume/models/diffusion_models /comfyui/models/diffusion_models && \
    ln -s /runpod-volume/models/vae /comfyui/models/vae && \
    ln -s /runpod-volume/models/upscale_models /comfyui/models/upscale_models && \
    ln -s /runpod-volume/models/text_encoders /comfyui/models/text_encoders

RUN comfy model download --url "https://civitai.com/api/download/models/3296803?fileId=3181606&token=00d4f9d5da710441e457df098bcb0386" --relative-path "models/diffusion_models" --filename "waianimaturbo.safetensors"
RUN comfy model download --url "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/vae/qwen_image_vae.safetensors" --relative-path "models/vae" --filename "qwen_image_vae.safetensors"
RUN comfy model download --url "https://huggingface.co/Kim2091/AnimeSharp/resolve/main/4x-AnimeSharp.pth" --relative-path "models/upscale_models" --filename "4x-AnimeSharp.pth"
RUN comfy model download --url "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/text_encoders/qwen_3_06b_base.safetensors" --relative-path "models/text_encoders" --filename "qwen_3_06b_base.safetensors"
