FROM runpod/worker-comfyui:5.10.0-base

# 1. Ensure extra_model_paths.yaml maps all required folders to the network volume
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

# 2. Performance flags to speed up inference and optimize VRAM usage
ENV TORCH_CUDA_ARCH_LIST="8.0;8.6;8.9;9.0"
ENV PYTHONUNBUFFERED=1
