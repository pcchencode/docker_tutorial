import sys, os
from ckiptagger import data_utils

dirname = f'data'
if os.path.isdir(dirname):
	os._exit(0)
else:
	data_utils.download_data_gdown("./")
	os._exit(0)
