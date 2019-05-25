## Android Helper

### Init
```
git clone --recursive https://github.com/YumeMichi/AndroidHelper.git
```

### Manually update
```
git clone https://github.com/YumeMichi/AndroidHelper.git
git submodule init
git submodule update
```

### Usage

One by one
```
./unzip.sh ~/Downloads/miui_MI8Global_V10.3.2.0.PEAMIXM_d9cf6c80bf_9.0.zip

./decbr.sh temp/system.new.dat.br

./dat2img.sh temp/system.new.dat

./mount.sh temp/system.img temp/system

./cleanup.sh
```

All in one
```
./setupblobs.sh ~/Downloads/miui_MI8Global_V10.3.2.0.PEAMIXM_d9cf6c80bf_9.0.zip
```
