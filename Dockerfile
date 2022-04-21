FROM nvcr.io/nvidia/deepstream-l4t:6.0.1-triton
RUN mkdir -p /app/src /app/mnt
WORKDIR /app/src
RUN git clone https://github.com/NVIDIA-AI-IOT/deepstream_tao_apps.git
WORKDIR /app/src/deepstream_tao_apps/
RUN bash download_models.sh
WORKDIR /app/src/deepstream_tao_apps/apps/tao_others/deepstream-bodypose2d-app
#ENV CUDA_VERSION = 10.2

#RUN CUDA_VER=10.2 make








WORKDIR /app/src
CMD bash


















