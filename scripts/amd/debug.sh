sudo apt install gdb -y
gdb -ex "set pagination off" \
    -ex "file python" \
    -ex 'run -m pytest --capture=tee-sys --verbose "tests/unit/test_sparse_attention.py::test_softmax[dtype1-256-16]"' \
    -ex "bt" \
    -ex "set confirm off" \
    -ex "q" \
    2>&1 | tee /dockerx/DeepSpeed_rocm/test_core_gdb.log
