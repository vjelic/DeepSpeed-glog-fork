cp -a csrc/includes/patch/hip/hcc_detail/hip_cooperative_groups.h /opt/rocm/include/hip/hcc_detail/hip_cooperative_groups.h &&
cp -a csrc/includes/patch/hip/hcc_detail/hip_cooperative_groups_helper.h /opt/rocm/include/hip/hcc_detail/hip_cooperative_groups_helper.h &&
# DS_BUILD_FUSED_ADAM=1 DS_BUILD_FUSED_LAMB=1 DS_BUILD_CPU_ADAM=1 DS_BUILD_TRANSFORMER=1 DS_BUILD_STOCHASTIC_TRANSFORMER=1 DS_BUILD_UTILS=1 ./install.sh --allow_sudo

pip uninstall deepspeed
DS_BUILD_SPARSE_ATTN=1 ./install.sh --allow_sudo