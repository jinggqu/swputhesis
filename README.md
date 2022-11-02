# 西南石油大学硕士学位论文 LaTeX 模板

本项目基于 [qingbyin](https://github.com/qingbyin) 在博士期间制作的学位论文模板 [swputhesis](https://github.com/qingbyin/swputhesis)。在此表示感谢。

## 效果预览
见 [swputhesis.pdf](https://github.com/sudrizzz/swputhesis/blob/main/swputhesis.pdf)。

## 前置条件

### 安装 TeXLive
请前往镜像站下载最新版 TeXLive，安装时可通过 customize 操作去除不需要的语言包（如韩语、德语等），以加快安装速度。

下载地址：[北京外国语大学镜像站](https://mirrors.bfsu.edu.cn/CTAN/systems/texlive/Images/)、[清华大学镜像站](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/)

### 安装字体
由于 Windows 附带的宋体与黑体仅有一个字重，因此在加粗时会使用假粗体（AutoFakeBold），导致笔画粘连等问题；且毕业论文模板并未声明宋体与黑体的具体类型，因此本模板采用思源宋体与思源黑体替换默认宋体与黑体。

**思源宋体**：[北京外国语大学镜像站](https://mirrors.bfsu.edu.cn/adobe-fonts/source-han-serif/SubsetOTF/CN/)、[清华大学镜像站](https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-serif/SubsetOTF/CN/)

**思源黑体**：[北京外国语大学镜像站](https://mirrors.bfsu.edu.cn/adobe-fonts/source-han-sans/SubsetOTF/CN/)、[清华大学镜像站](https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-sans/SubsetOTF/CN/)

分别下载两种字体的**所有字重**（共 14 个字体文件）后，在资源管理器中选中所有字体，右键选择**为所有用户安装**即可。

## 使用方法
### 手动编译（较硬核，不推荐）

1. 使用 `latexmk` 编译
在 swputhesis.tex 所在目录打开终端，执行如下命令即可编译。  
```shell
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -xelatex swputhesis.tex
```

2. 使用 `xelatex` 编译
如果使用 `xelatex` 编译项目，那么需要按照 `xelatex -> biber -> xelatex -> xelatex` 的顺序依次调用 `xelatex` 与 `biber` 命令行工具，命令如下。

```shell
# 第一步 xelatex
xelatex -no-pdf --interaction=nonstopmode swputhesis.tex
# 第二步 biber
biber swputhesis
# 第三步 xelatex
xelatex -no-pdf --interaction=nonstopmode swputhesis.tex
# 第四步 xelatex
xelatex --interaction=nonstopmode swputhesis.tex
```

编译完成后会在项目根目录中生成 swputhesis.pdf。

### 在 VSCode 中编译

**下述编译方式都已配置好，无需再次配置，直接使用即可。相关配置见项目路径下 `.vscode/settings.json`。**  

首先需要安装 [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件。打开 swputhesis.tex 时，左侧导航栏会出现 TeX 菜单。

1. 使用 `latexmk` 编译
点击 TeX 菜单，选择 COMMANDS -> Build LaTeX Project -> **Recipe: latexmk** 即可编译。

2. 使用 `xelatex` 编译
点击 TeX 菜单，选择 COMMANDS -> Build LaTeX Project -> **Recipe: xelatex -> biber -> xelatex\*2** 即可编译。

## 参考文献管理
为了方便配置中文参考文献和国标要求，使用 biblatex + `biber` 而不是默认的 BibTeX。

## 已知问题
目前项目仍处于早期开发版本，欢迎提交 issue 和 pull request。
1. 由于学术硕士和专业硕士封面存在较大差异，建议使用 Word 单独制作封面；

## 免责申明
由于学校图书馆网站上说明只接受 Word 格式的学位论文文档（见[学位论文提交系统常见问题](https://lib.swpu.edu.cn/95_80/mason/0317x/faq.html?q=13#a)），本模板不能保证在提交学校审查时能一切顺利，请提前咨询相关负责老师。

## 参考资料

1. [一份不太简短的 LaTeX2ε 介绍](https://mirrors.bfsu.edu.cn/CTAN/info/lshort/chinese/lshort-zh-cn.pdf)
2. [北京理工大学非官方本科生毕业设计、毕业论文的 LaTeX 模板文档指南](https://bithesis.spencerwoo.com/Guide/2-Usage/Downloading-and-using-templates.html#%E4%BD%BF%E7%94%A8-vs-code-%E6%92%B0%E5%86%99%E4%B8%8E%E7%BC%96%E8%AF%91-latex-%E6%A8%A1%E6%9D%BF)