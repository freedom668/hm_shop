# hm_shop（惠多美商城）

基于 Flutter 开发的移动端商城应用，支持 Android / iOS 平台。

## 功能概览

- **首页** — Banner 轮播、分类导航、特惠推荐、热榜推荐、一站式买全、无限滚动推荐列表、下拉刷新
- **分类** — 商品分类浏览（待完善）
- **购物车** — 购物车管理（待完善）
- **我的** — 用户信息展示、VIP 会员卡、订单管理入口、快捷操作（收藏/足迹/客服）、猜你喜欢、退出登录
- **登录** — 手机号 + 密码登录、表单校验、隐私条款确认、Token 持久化、登录状态自动恢复

## 技术栈

| 类别 | 方案 |
|------|------|
| 框架 | Flutter (Dart SDK ^3.11.3) |
| 状态管理 | [GetX](https://pub.dev/packages/get) |
| 网络请求 | [Dio](https://pub.dev/packages/dio) |
| 本地存储 | [SharedPreferences](https://pub.dev/packages/shared_preferences) |
| 轮播组件 | [Carousel Slider](https://pub.dev/packages/carousel_slider) |

## 项目结构

```
lib/
├── main.dart                 # 应用入口
├── routes/
│   └── index.dart            # 路由定义
├── pages/
│   ├── Main/                 # 首页（底部 Tab 导航 + IndexedStack）
│   ├── Home/                 # 首页（Banner / 分类 / 推荐）
│   ├── Category/             # 分类页
│   ├── Cart/                 # 购物车页
│   ├── Mine/                 # 我的页面
│   └── Login/                # 登录页
├── components/
│   ├── Home/                 # 首页子组件（Slider / Category / Hot / MoreList...）
│   └── Mine/                 # 我的页面子组件
├── api/                      # 接口层（home / user / mine）
├── viewmodels/               # 数据模型（home / user）
├── stores/                   # 状态管理（GetX UserContainer / TokenManager）
├── utils/                    # 工具类（Dio 封装 / Toast / Loading）
├── constants/                # 常量（BaseUrl / API 路径 / Token Key）
└── assets/                   # 图片资源
```

## 快速开始

### 环境要求

- Flutter SDK >= 3.11.3
- Dart SDK >= 3.11.3
- Android Studio / Xcode

### 安装运行

```bash
# 克隆项目
git clone <repo-url>
cd hm_shop

# 安装依赖
flutter pub get

# 运行
flutter run
```

### 打包构建

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release
```

## 已有提交记录

| 提交 | 说明 |
|------|------|
| `69154b0` | 实现安卓端适配 |
| `d4acc1d` | 退出登录实现弹层 |
| `5441365` | Token 持久化 |
| `5ac079f` | 使用 GetX 共享用户信息 |
| `d384e06` | 登录功能并提示异常信息 |
| `8ce5e53` | 完成下拉刷新消息提示封装 |
| `b38a9ff` | 集成推荐列表的数据 |
| `9ba7d0d` | 爆款推荐和一站买全快速搭建 |
