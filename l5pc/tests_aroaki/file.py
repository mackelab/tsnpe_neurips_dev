from l5pc.model import L5PC_20D_theta, L5PC_20D_x
from l5pc.model.utils import return_x_names, return_names, return_xo, return_gt

t = L5PC_20D_theta()
x = L5PC_20D_x()

from l5pc.model.utils import (
    return_gt,
    return_xo,
    return_x_names,
    return_names,
)
import torch
import dill
import pickle
from l5pc.model import (
    simulate_l5pc,
    setup_l5pc,
    summstats_l5pc,
)
from l5pc.utils.common_utils import (
    load_prior,
    extract_bounds,
    load_posterior,
)

import pandas as pd
import numpy as np
from l5pc.utils.common_utils import load_prior
from os.path import join
from torch import float32, as_tensor
import time

setup_l5pc()
prior = load_prior(20, [[],[]])
inference, posterior_r4, used_features, round_ = load_posterior("l20_0", "2022_04_19__20_55_09_snpe_m/0")
posterior_samples_r4 = posterior_r4.sample((10,))
posterior_samples_r4 = pd.DataFrame(posterior_samples_r4.numpy(), columns=return_names())

inference, posterior_r5, used_features, round_ = load_posterior("l20_0", "2022_04_20__10_27_58_snpe_m/0")
posterior_samples_r5 = posterior_r5.sample((10,))
posterior_samples_r5 = pd.DataFrame(posterior_samples_r5.numpy(), columns=return_names())

prior_samples = prior.sample((10,))
prior_samples = pd.DataFrame(prior_samples.numpy(), columns=return_names())

start_time = time.time()
prior_predictives = simulate_l5pc(prior_samples)
print("Prior time", time.time() - start_time)

# start_time = time.time()
# posterior_predictives_r4 = simulate_l5pc(posterior_samples_r4)
# print("Posterior R4 time", time.time() - start_time)

# start_time = time.time()
# posterior_predictives_r5 = simulate_l5pc(posterior_samples_r5)
# print("Posterior R5 time", time.time() - start_time)
