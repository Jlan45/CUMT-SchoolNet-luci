# CUMT-SchoolNet-luci
一个用来自动登录矿大校园网的openwrt插件

[![Build IPK Package](https://github.com/Jlan45/CUMT-SchoolNet-luci/actions/workflows/build-ipk.yml/badge.svg)](https://github.com/Jlan45/CUMT-SchoolNet-luci/actions/workflows/build-ipk.yml)

## 安装

### 方法1: 下载预编译的IPK包
从 [Releases](https://github.com/Jlan45/CUMT-SchoolNet-luci/releases) 页面下载最新的 `cumtlogin_*.ipk` 文件，然后通过OpenWrt的LuCI界面上传安装，或使用以下命令：

```bash
opkg install cumtlogin_*.ipk
```

### 方法2: 在OpenWrt SDK中编译
1. 下载OpenWrt SDK
2. 将此项目克隆到 `package/cumtlogin` 目录
3. 运行以下命令编译：
```bash
make package/cumtlogin/compile
```

## 功能
![](https://jlan-blog.oss-cn-beijing.aliyuncs.com/202311081825257.png)
可以直接在对应位置填入身份信息后，设定测试时间自动进行断网登录尝试
