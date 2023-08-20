#!/bin/bash
squeue --format="%.14i %.9P %.14j %.8u %.10T %.10M %.9l %.6D %R" --me
