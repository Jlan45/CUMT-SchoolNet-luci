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
可以直接在对应位置填入身份信息后，设定测试时间自动进行断网登录尝试

## 配置项说明

在 LuCI 界面中进入 **Services → 矿大校园网** 进行配置，各选项说明如下：

| 配置项 | 说明 |
|--------|------|
| **Enable** | 是否启用插件（关闭后不会在开机时自动登录，也不会设置定时任务） |
| **Username** | 学号/校园网账号 |
| **Password** | 校园网密码 |
| **上网类型** | 选择运营商：中国移动（`@cmcc`）、中国联通（`@unicom`）、中国电信（`@telecom`）或校园网（默认） |
| **测试主机** | 用于检测网络连通性的主机名，例如 `www.baidu.com` |
| **测试时间(小时)** | 检测网络的时间间隔（小时），取值范围 1–24 |
| **测试方法** | 检测方式：`ping`（ICMP）或 `curl`（HTTP GET） |

配置保存后插件会立即重启并尝试登录，同时按设定的时间间隔建立定时检测任务。

## 日志

登录日志保存在 `/tmp/cumtloginlog`，可通过以下命令查看：

```bash
cat /tmp/cumtloginlog
```
