# RL

## 1. Installation
Creation of RL environment requires `unrar` of `ROM`s provided by [Atari](http://www.atarimania.com/roms/Roms.rar). We have **already** downloaded the `ROMs.rar` file and unrared it in `mnt/data/atari_data` with the following command. 
```
wget http://www.atarimania.com/roms/Roms.rar
unrar x Roms.rar .
```
So, in order to import the unrared ROMs, run the following command. (However, this command is included in the `entrypoint.sh` which is run when docker container is run, so no explicit run of the following command is required)
```
python -m atari_py.import_roms /mnt/data/atari_data/
```

Therefore.. everything is already set up! Happy RL!

## 2. How to run 
Run the following command to execute the target yaml file and log to the target log file.
```
rllib train -f $target_yaml >> /mnt/code/profiler/results/$target_log
```