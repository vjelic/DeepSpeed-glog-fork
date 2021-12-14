pytest --verbose tests/unit/test_sparse_attention.py |& tee /dockerx/DeepSpeed_rocm/test_sparse_attention.log
# pytest --verbose tests/unit/test_sparse_attention.py::test_softmax[dtype1-256-16]
# pytest --verbose tests/unit/test_sparse_attention.py::test_softmax 