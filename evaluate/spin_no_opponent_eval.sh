lm_eval --model hf \
    --model_args pretrained=alignment-handbook/zephyr-7b-sft-full \
    --tasks hellaswag \
    --num_fewshot 10 \
    --device cuda:0 \
    --batch_size auto:4 \
# /home/caj20001/SPIN/outputs/checkpoint-9336