cd ~/BOML
mkdir test && cd ./test

# 创建配置文件
cat <<EOF > test.json
{
  "mode":"train",
  "dataset":"omniglot",
  "classes":5,
  "T":2,
  "meta_lr":0.001,
  "lr":0.1,
  "examples_train":1,
  "examples_test":15,
  "meta_batch_size":20,
  "meta_train_iterations":2000,
  "method":"MetaFeat",
  "inner_method": "Trad",
  "outer_method":"Reverse",
  "learn_lr":"false",
  "logdir":".../tmp/",
  "print_interval":50,
  "save_interval":200
}
EOF

# 创建运行文件 （针对于meta_feat这种情况）
cat <<EOF > run.sh
#!/bin/sh
cd ../test_script
python test_meta_feat.py --name_of_args_json_file ../test/test.json
EOF

bash run.sh
