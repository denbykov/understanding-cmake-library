FROM ubuntu:24.04

RUN apt update -y && \
    apt upgrade -y 

RUN apt install -y sudo \
    git \
    cmake \
    ninja-build \
    gdb \
    build-essential \
    clang

ARG USERNAME=ubuntu

# ARG USERNAME=developer
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
#     && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#     && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
