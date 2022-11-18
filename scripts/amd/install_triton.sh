set -e

# pip3 install -r requirements/requirements-sparse_attn.txt

# install from personal fork
cd /tmp 
rm -rf triton
mkdir -p triton
git clone https://github.com/ROCmSoftwarePlatform/triton
cd triton
cd python
export TRITON_USE_ROCM=ON
export MI_GPU_ARCH=gfx90a
pip3 uninstall -y triton 
pip install --verbose -e .
pip install -U matplotlib pandas filelock
