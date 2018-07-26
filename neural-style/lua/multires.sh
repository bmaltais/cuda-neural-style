# To run this script you'll need to download the ultra-high res
# scan of Starry Night from the Google Art Project, available here:
# https://commons.wikimedia.org/wiki/File:Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg

STYLE_IMAGE=$2
CONTENT_IMAGE=$1

STYLE_WEIGHT=1000
CONTENT_WEIGHT=100
STYLE_SCALE=1.0

th ../neural_style.lua \
  -content_image $CONTENT_IMAGE \
  -style_image $STYLE_IMAGE \
  -output_image results/out480.jpg \
  -style_scale $STYLE_SCALE \
  -style_weight $STYLE_WEIGHT \
  -content_weight $CONTENT_WEIGHT \
  -print_iter 10 \
  -save_iter 50 \
  -image_size 480 \
  -num_iterations 1500 \
  -tv_weight 0.000085 \
  -init image -normalize_gradients \
  -backend cudnn -cudnn_autotune \
  -model_file ../models/VGG_ILSVRC_19_layers.caffemodel \
  -proto_file ../models/VGG_ILSVRC_19_layers_deploy.prototxt \
  -content_layers relu1_1,relu2_1,relu3_1,relu4_1,relu4_2,relu5_1 \
  -style_layers relu1_1,relu2_1,relu3_1,relu4_1,relu4_2,relu5_1

th ../neural_style_adam.lua -normalize_gradients \
  -content_image $CONTENT_IMAGE \
  -style_image $STYLE_IMAGE \
  -init image -init_image results/out480.jpg \
  -output_image results/out512.jpg \
  -tv_weight 0.000085 -image_size 512 \
  -save_iter 50 \
  -style_scale $STYLE_SCALE \
  -style_weight $STYLE_WEIGHT \
  -content_weight $CONTENT_WEIGHT \
  -num_iterations 400 \
  -model_file ../models/nin_imagenet.caffemodel \
  -proto_file ../models/nin_imagenet_deploy.prototxt \
  -content_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8,relu9,relu10,relu11,relu12 \
  -style_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8,relu9,relu10,relu11,relu12 \
  -backend cudnn -cudnn_autotune -optimizer adam -beta1 0.99 -epsilon 1e-1

th ../neural_style_adam.lua -normalize_gradients \
  -content_image $CONTENT_IMAGE \
  -style_image $STYLE_IMAGE \
  -init image -init_image results/out512.jpg \
  -output_image results/out1024.jpg \
  -tv_weight 0.000085 -image_size 1024 \
  -save_iter 50 \
  -style_scale $STYLE_SCALE \
  -style_weight $STYLE_WEIGHT \
  -content_weight $CONTENT_WEIGHT \
  -num_iterations 400 \
  -model_file ../models/nin_imagenet.caffemodel \
  -proto_file ../models/nin_imagenet_deploy.prototxt \
  -content_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8,relu9,relu10,relu11,relu12 \
  -style_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8,relu9,relu10,relu11,relu12 \
  -backend cudnn -cudnn_autotune -optimizer adam -beta1 0.99 -epsilon 1e-1

  th ../neural_style_adam.lua -normalize_gradients \
  -content_image $CONTENT_IMAGE \
  -style_image $STYLE_IMAGE \
  -init image -init_image results/out1024.jpg \
  -output_image results/out2048.jpg \
  -tv_weight 0.000085 -image_size 2048 \
  -save_iter 50 \
  -style_scale $STYLE_SCALE \
  -style_weight $STYLE_WEIGHT \
  -content_weight $CONTENT_WEIGHT \
  -num_iterations 400 \
  -model_file ../models/nin_imagenet.caffemodel \
  -proto_file ../models/nin_imagenet_deploy.prototxt \
  -content_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8,relu9,relu10,relu11,relu12 \
  -style_layers relu0,relu1,relu2,relu3,relu5,relu6,relu7,relu8,relu9,relu10,relu11,relu12 \
  -backend cudnn -cudnn_autotune -optimizer adam -beta1 0.99 -epsilon 1e-1