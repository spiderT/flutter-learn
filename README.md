# flutter

## 1. 在macOS上搭建Flutter开发环境

### 1.1. 获取Flutter SDK
[去flutter官网下载其最新可用的安装包](https://flutter.io/sdk-archive/#macos) 。

```text
cd ~/development
unzip ~/Downloads/flutter_macos_v0.5.1-beta.zip

```


添加flutter相关工具到path中：

```text
export PATH=`pwd`/flutter/bin:$PATH
```

#### 1.1.1. 运行 flutter doctor

该命令检查您的环境并在终端窗口中显示报告。Dart SDK已经在捆绑在Flutter里了，没有必要单独安装Dart。 仔细检查命令行输出以获取可能需要安装的其他软件或进一步需要执行的任

#### 1.1.2. 更新环境变量

1. 确定您Flutter SDK的目录，您将在步骤3中用到。
2. 打开(或创建) $HOME/.bash_profile. 文件路径和文件名可能在您的机器上不同.
3. 添加以下行并更改[PATH_TO_FLUTTER_GIT_DIRECTORY]为克隆Flutter的git repo的路径:

```text
export PUB_HOSTED_URL=https://pub.flutter-io.cn //国内用户需要设置
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn //国内用户需要设置
export PATH= PATH_TO_FLUTTER_GIT_DIRECTORY/flutter/bin:$PATH
```

注意：PATH_TO_FLUTTER_GIT_DIRECTORY 为你flutter的路径，比如“~/document/code”

```text
 export PATH= ~/document/code/flutter/bin:$PATH
```
4. 运行 source $HOME/.bash_profile 刷新当前终端窗口.
 *注意*: 如果你使用的是zsh，终端启动时 ~/.bash_profile 将不会被加载，解决办法就是修改 ~/.zshrc ，在其中添加：source ~/.bash_profile
 
5. 通过运行flutter/bin命令验证目录是否在已经在PATH中:

```text
echo $PATH
``` 

### 1.2. iOS 设置

#### 1.2.1 安装 Xcode

1. 要为iOS开发Flutter应用程序，您需要Xcode 7.2或更高版本:

2. 安装Xcode 7.2或更新版本.

配置Xcode命令行工具以使用新安装的Xcode版本 sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer 对于大多数情况，当您想要使用最新版本的Xcode时，这是正确的路径。如果您需要使用不同的版本，请指定相应路径。

3. 确保Xcode许可协议是通过打开一次Xcode或通过命令sudo xcodebuild -license同意过了.

使用Xcode，您可以在iOS设备或模拟器上运行Flutter应用程序。

#### 1.2.2 设置iOS模拟器

1. 要准备在iOS模拟器上运行并测试您的Flutter应用，请按以下步骤操作：

在Mac上，通过Spotlight或使用以下命令找到模拟器:
```text
open -a Simulator
```
2. 通过检查模拟器 硬件>设备 菜单中的设置，确保您的模拟器正在使用64位设备（iPhone 5s或更高版本）.
3. 根据您的开发机器的屏幕大小，模拟的高清屏iOS设备可能会使您的屏幕溢出。在模拟器的 Window> Scale 菜单下设置设备比例
4. 运行 flutter run启动您的应用.


#### 1.2.3 安装到iOS设备

要将您的Flutter应用安装到iOS真机设备，您需要一些额外的工具和一个Apple帐户，您还需要在Xcode中进行设置。

1. 安装 homebrew （如果已经安装了brew,跳过此步骤）.
2. 打开终端并运行这些命令来安装用于将Flutter应用安装到iOS设备的工具

```text
brew update
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy cocoapods
pod setup
```


### 1.3 Android设置

#### 1.3.1 Flutter需要安装和配置Android Studio:

1. 下载并安装 Android Studio.

2. 启动Android Studio，然后执行“Android Studio安装向导”。这将安装最新的Android SDK，Android SDK平台工具和Android SDK构建工具，这是Flutter为Android开发时所必需的



#### 1.3.2 设置您的Android设备
要准备在Android设备上运行并测试您的Flutter应用，需要安装Android 4.1（API level 16）或更高版本的Android设备.

1. 在您的设备上启用 开发人员选项 和 USB调试 。详细说明可在Android文档中找到。
2. 使用USB将手机插入电脑。如果您的设备出现提示，请授权您的计算机访问您的设备。
3. 在终端中，运行 flutter devices 命令以验证Flutter识别您连接的Android设备。
4. 运行启动您的应用程序 flutter run。
默认情况下，Flutter使用的Android SDK版本是基于你的 adb 工具版本。 如果您想让Flutter使用不同版本的Android SDK，则必须将该 ANDROID_HOME 环境变量设置为SDK安装目录。

#### 1.3.3 设置Android模拟器
要准备在Android模拟器上运行并测试您的Flutter应用，请按照以下步骤操作：

1. 在您的机器上启用 VM acceleration .
2. 启动 Android Studio>Tools>Android>AVD Manager 并选择 Create Virtual Device.
3. 选择一个设备并选择 Next。
4. 为要模拟的Android版本选择一个或多个系统映像，然后选择 Next. 建议使用 x86 或 x86_64 image .
5. 在 Emulated Performance下, 选择 Hardware - GLES 2.0 以启用 硬件加速.
6. 验证AVD配置是否正确，然后选择 Finish。
7. 在 Android Virtual Device Manager中, 点击工具栏的 Run。模拟器启动并显示所选操作系统版本或设备的启动画面.
8. 运行 flutter run 启动您的设备. 连接的设备名是 Android SDK built for <platform>,其中 platform 是芯片系列, 如 x86.

## 2. flutter 核心技术

Flutter 是构建 Google 物联网操作系统 Fuchsia 的 SDK，主打跨平台、高保真、高性能。开发者可以通过 Dart 语言开发 App，一套代码可以同时运行在 iOS 和 Android 平台。 Flutter 使用 Native 引擎渲染视图，并提供了丰富的组件和接口，这无疑为开发者和用户都提供了良好的体验。

1. 与用于构建移动应用程序的其他大多数框架不同，Flutter 是重写了一整套包括底层渲染逻辑和上层开发语言的完整解决方案。这样不仅可以保证视图渲染在 Android 和 iOS 上的高度一致性（即高保真），在代码执行效率和渲染性能上也可以媲美原生 App 的体验（即高性能）。

2. 可以看到，Flutter 关注如何尽可能快地在两个硬件时钟的 VSync 信号之间计算并合成视图数据，然后通过 Skia 交给 GPU 渲染：UI 线程使用 Dart 来构建视图结构数据，这些数据会在 GPU 线程进行图层合成，随后交给 Skia 引擎加工成 GPU 数据，而这些数据会通过 OpenGL 最终提供给 GPU 渲染。

![flutter绘制原理](./images/flutter1.png)

3. Skia 是一款用 C++ 开发的、性能彪悍的 2D 图像绘制引擎，其前身是一个向量绘图软件。2005 年被 Google 公司收购后，因为其出色的绘制表现被广泛应用在 Chrome 和 Android 等核心产品上。Skia 在图形转换、文字渲染、位图渲染方面都表现卓越，并提供了开发者友好的 API。

4. Dart

+ Dart 同时支持即时编译 JIT 和事前编译 AOT。在开发期使用 JIT，开发周期异常短，调试方式颠覆常规（支持有状态的热重载）；而发布期使用 AOT，本地代码的执行更高效，代码性能和用户体验也更卓越。

+ Dart 作为一门现代化语言，集百家之长，拥有其他优秀编程语言的诸多特性（比如，完善的包管理机制）。也正是这个原因，Dart 的学习成本并不高，很容易上手。

+ Dart 避免了抢占式调度和共享内存，可以在没有锁的情况下进行对象分配和垃圾回收，在性能方面表现相当不错。

### 2.1 flutter 原理

![flutter架构图](./images/flutter2.png)

Flutter 架构采用分层设计，从下到上分为三层，依次为：Embedder、Engine、Framework。

1. Embedder 是操作系统适配层，实现了渲染 Surface 设置，线程设置，以及平台插件等平台相关特性的适配。从这里我们可以看到，Flutter 平台相关特性并不多，这就使得从框架层面保持跨端一致性的成本相对较低。

2. Engine 层主要包含 Skia、Dart 和 Text，实现了 Flutter 的渲染引擎、文字排版、事件处理和 Dart 运行时等功能。Skia 和 Text 为上层接口提供了调用底层渲染和排版的能力，Dart 则为 Flutter 提供了运行时调用 Dart 和渲染引擎的能力。而 Engine 层的作用，则是将它们组合起来，从它们生成的数据中实现视图渲染。

3. Framework 层则是一个用 Dart 实现的 UI SDK，包含了动画、图形绘制和手势识别等功能。为了在绘制控件等固定样式的图形时提供更直观、更方便的接口，Flutter 还基于这些基础能力，根据 Material 和 Cupertino 两种视觉设计风格封装了一套 UI 组件库。我们在开发 Flutter 的时候，可以直接使用这些组件库。