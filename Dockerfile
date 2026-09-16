FROM runpod/worker-comfyui:5.10.0-base

# Fix extra_model_paths.yaml to include diffusion_models and text_encoders
RUN printf 'runpod_worker_comfy:\n\
  base_path: /runpod-volume\n\
  checkpoints: models/checkpoints/\n\
  clip: models/clip/\n\
  text_encoders: models/text_encoders/\n\
  diffusion_models: models/diffusion_models/\n\
  unet: models/unet/\n\
  vae: models/vae/\n\
  upscale_models: models/upscale_models/\n\
  loras: models/loras/\n' > /comfyui/extra_model_paths.yaml
