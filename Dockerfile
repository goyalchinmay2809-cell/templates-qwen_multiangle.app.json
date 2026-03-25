# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-qwenmultiangle@0.5.0 --mode remote

# download models into comfyui
# # download models into comfyui
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Qwen_Image_Edit_2511/resolve/main/qwen_image_edit_2511_bf16.safetensors \
    --relative-path models/diffusion_models \
    --filename qwen_image_edit_2511_bf16.safetensors

RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Qwen_Image_Edit_2511/resolve/main/qwen_2.5_vl_7b.safetensors \
    --relative-path models/text_encoders \
    --filename qwen_2.5_vl_7b.safetensors

RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Qwen_Image_Edit_2511/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-lora.safetensors \
    --relative-path models/loras \
    --filename Qwen-Image-Edit-2511-Lightning-4steps-V1.0-lora.safetensors

RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Qwen_Image_Edit_2511/resolve/main/qwen-image-edit-2511-multiple-angles-lora.safetensors \
    --relative-path models/loras \
    --filename qwen-image-edit-2511-multiple-angles-lora.safetensors


# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
