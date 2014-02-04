#!/bin/bash

echo "timing memcpy_orig"
time ./memcpy_orig
echo "timing memcpy_asm"
time ./memcpy_asm
echo "timing memcpy_dumb"
time ./memcpy_dumb
echo "timing memcpy_orig_o3"
time ./memcpy_orig_o3
echo "timing memcpy_asm_o3"
time ./memcpy_asm_o3
echo "timing memcpy_dumb_o3"
time ./memcpy_dumb_o3
