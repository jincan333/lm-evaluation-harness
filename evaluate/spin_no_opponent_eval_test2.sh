lm_eval --model hf \
    --model_args pretrained=/home/caj20001/SPIN/outputs/ \
    --tasks hellaswag \
    --num_fewshot 10 \
    --device cuda:3 \
    --batch_size auto:4 \
    > logs/test2.log 2>&1 &
# /home/caj20001/SPIN/outputs/checkpoint-9336