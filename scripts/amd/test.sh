ROOT_DIR=$(pwd)
LOG_DIR=$ROOT_DIR/log_$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
rm -rf $LOG_DIR
mkdir -p $LOG_DIR
chmod -R 777 $LOG_DIR

pytest --verbose tests/unit/test_sparse_attention.py 2>&1 | tee $LOG_DIR/test_sparse_attention.log
# pytest --verbose tests/unit/test_sparse_attention.py::test_matmul[32-dtype14-dds-False-False]
# pytest --verbose tests/unit/test_sparse_attention.py::test_softmax[dtype1-256-16]
# pytest --verbose tests/unit/test_sparse_attention.py::test_softmax
