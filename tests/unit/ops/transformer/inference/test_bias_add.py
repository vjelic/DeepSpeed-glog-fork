# Copyright (c) Microsoft Corporation.
# SPDX-License-Identifier: Apache-2.0

# DeepSpeed Team

import pytest
import torch
import deepspeed
from deepspeed.accelerator import get_accelerator
from deepspeed.ops.op_builder import InferenceBuilder
from deepspeed.ops.transformer import DeepSpeedInferenceConfig
from deepspeed.ops.transformer.inference.op_binding.bias_add import BiasAddOp
from .inference_test_utils import allclose, get_dtypes

if not deepspeed.ops.__compatible_ops__[InferenceBuilder.NAME]:
    pytest.skip("Inference ops are not available on this system", allow_module_level=True)


def run_bias_add_reference(activations, bias):
    return activations + bias


def run_bias_add_ds(activations, bias):
    config = DeepSpeedInferenceConfig(dtype=activations.dtype)
    return BiasAddOp(config)(activations, bias)


@pytest.mark.inference_ops
@pytest.mark.parametrize("batch", [1, 2])
@pytest.mark.parametrize("sequence", [1, 128, 255])
@pytest.mark.parametrize("channels", [512, 1232, 4096])
@pytest.mark.parametrize("dtype", get_dtypes())
def test_bias_add(batch, sequence, channels, dtype):
    activations_ds = torch.randn((batch, sequence, channels), dtype=dtype, device=get_accelerator().device_name())
    bias_ds = torch.randn((channels), dtype=dtype, device=get_accelerator().device_name())

    activations_ref = activations_ds.clone().detach()
    bias_ref = bias_ds.clone().detach()

    ds_out = run_bias_add_ds(activations_ds, bias_ds)
    ref_out = run_bias_add_reference(activations_ref, bias_ref)
    if not allclose(ds_out, ref_out):
        print((ds_out - ref_out).abs().max())
        assert (allclose(ds_out, ref_out))
