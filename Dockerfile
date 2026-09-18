FROM runpod/worker-comfyui:5.10.0-base

ENV PYTHONUNBUFFERED=1 \
    HF_HUB_OFFLINE=1 \
    HF_DATASETS_OFFLINE=1 \
    DISABLE_TELEMETRY=1 \
    PYTORCH_CUDA_ALLOC_CONF="garbage_collection_threshold:0.9,max_split_size_mb:512" \
    LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

RUN apt-get update && apt-get install -y --no-install-recommends libjemalloc2 && apt-get clean && rm -rf /var/lib/apt/lists/* && printf 'runpod_worker_comfy:\n  base_path: /runpod-volume\n  checkpoints: models/checkpoints/\n  clip: models/clip/\n  text_encoders: models/text_encoders/\n  diffusion_models: models/diffusion_models/\n  unet: models/unet/\n  vae: models/vae/\n  upscale_models: models/upscale_models/\n  loras: models/loras/\n' > /comfyui/extra_model_paths.yaml
