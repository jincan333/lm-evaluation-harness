#!/bin/bash
exp_name='none_opponent'
prefix='1'
# ai2_arc 25   hellaswag 10   truthfulqa 0   winogrande 5   gsm8k 5   mmlu 5
dataset='ai2_arc'
num_fewshot=25
epoch=1
gpu=1
seed=0
declare -A model_dict

model_dict=( ["1"]="/home/caj20001/SPIN/outputs/checkpoint-1556" ["2"]="/home/caj20001/SPIN/outputs/checkpoint-3112" )
pretrained=${model_dict[$epoch]}

if [ ! -d "${exp_name}" ]; then
    mkdir ${exp_name}
fi
while true; do
    log_filename=${exp_name}/${prefix}_${dataset}_num_fewshot${num_fewshot}_gpu${gpu}_seed${seed}.log
    if [ ! -f "${log_filename}" ]; then
        break
    fi
    seed=$((seed + 1))
done
nohup lm_eval --model hf \
    --model_args pretrained=${pretrained} \
    --tasks ${dataset} \
    --num_fewshot ${num_fewshot} \
    --device cuda:${gpu} \
    --batch_size auto:4 \
    > ${log_filename} 2>&1 &
# /home/caj20001/SPIN/outputs/checkpoint-9336
# 80.94