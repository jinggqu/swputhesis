# 西南石油大学硕士学位论文 LaTeX 模板

`SWPUThesis` 是 [qingbyin](https://github.com/qingbyin) 师兄在写博士论文时制作的 `LaTeX` 学位论文模板。在此表示感谢。

## 效果预览
见 [swputhesis.pdf](https://github.com/sudrizzz/SWPUThesis/blob/main/swputhesis.pdf)。

## 前置条件

### 安装 TexLive
请前往镜像站下载最新版 TexLive，安装时可通过 customize 操作去除不需要的语言包（如韩语、德语等），以加快安装速度。

（推荐）北京外国语大学镜像站：https://mirrors.bfsu.edu.cn/CTAN/systems/texlive/Images/  
清华大学镜像站：https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/

### 安装字体
由于 Windows 附带的宋体与黑体仅有一个字重，因此在加粗时会使用假粗体，导致笔画粘连等问题，因此本模板采用思源宋体与思源黑体替换默认宋体与黑体。

思源宋体：
（推荐）北京外国语大学镜像站：https://mirrors.bfsu.edu.cn/adobe-fonts/source-han-serif/SubsetOTF/CN/  
清华大学镜像站：https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-serif/SubsetOTF/CN/

思源黑体：
（推荐）北京外国语大学镜像站：https://mirrors.bfsu.edu.cn/adobe-fonts/source-han-sans/SubsetOTF/CN/  
清华大学镜像站：https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-sans/SubsetOTF/CN/

分别下载两种字体的所有字重后，在资源管理器中选中所有字体，右键选择**为所有用户安装**即可。

## 使用方法

### 终端编译
在 `swputhesis.tex` 所在目录打开终端，执行 `xelatex swputhesis.tex`  即可。若编译成功，则会在当前目录生成 `swputhesis.pdf`。

### 在 VSCode 中编译
首先需要安装 [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件，打开 `swputhesis.tex` 时，左侧导航栏会出现 TeX 菜单，选择 Comman -> Build LaTeX Project -> **Recipe: latexmk (xelatex)** 即可编译。

## 参考文献管理

为了方便配置中文参考文献和国标要求，使用 biblatex + biber 而不是默认的\BibTeX。

## 已知问题

封面格式存在问题，正在调整中。欢迎提交 Pull Request。

## 免责申明

由于学校图书馆网站上说明只接受 Word 格式的学位论文文档
(见[学位论文提交系统常见问题](https://lib.swpu.edu.cn/95_80/mason/0317x/faq.html?q=13#a))，
本模板不能保证在提交学校审查时能一切顺利，
请提前咨询相关负责老师。
