FROM runpod/worker-comfyui:5.8.5-base

# Configure ComfyUI to search both modern and legacy model folder names on the volume
RUN printf "runpod_volume:\n  base_path: /runpod-volume\n  checkpoints: models/checkpoints/\n  clip: models/clip/\n  text_encoders: models/text_encoders/\n  diffusion_models: models/diffusion_models/\n  unet: models/unet/\n  vae: models/vae/\n  upscale_models: models/upscale_models/\n  loras: models/loras/\n" > /comfyui/extra_model_paths.yaml
