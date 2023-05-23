for batchsize in 8 16 32
do

for model in "vgg19" "resnet50" "mobilenetv3_small_075" "efficientnet_b3"
do

./run_timm_4gpus.sh train_${model}_${batchsize}.txt ${model} ${batchsize}
sleep 1m;

done

done
