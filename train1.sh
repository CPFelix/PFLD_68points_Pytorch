#!/usr/bin/env bash
save_model=./models/model0
logs=./models/log0.txt
lr=0.01
train_list = "/home/chenpengfei/dataset/hand_labels/manual_train/manual_train.txt"
test_list = "/home/chenpengfei/dataset/hand_labels/manual_test/manual_test.txt"

CUDA_VISIBLE_DEVICES=2 python -u train_model.py --model_dir=${save_model} \
                                                --learning_rate=${lr} \
                                                --lr_epoch='50,70,90,95' \
                                                --file_list=train_list
                                                --test_list = test_list
				                				--level=L1 \
				                				--image_size=112 \
				                				--image_channels=3 \
				                				--batch_size=256 \
					        					--max_epoch=100 \
                                                > ${logs} 2>&1 &
tail -f ${logs}
