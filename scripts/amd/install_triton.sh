set -e

# pip3 install -r requirements/requirements-sparse_attn.txt

# install from personal fork
cd /tmp 
rm -rf triton
mkdir -p triton
git clone https://github.com/micmelesse/triton
cd triton
git checkout rocm_add_addition_clean
cd python
pip3 uninstall -y triton 
pip3 install --verbose -e .
