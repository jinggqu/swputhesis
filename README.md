# 西南石油大学硕士学位论文 LaTeX 模板

本项目基于 [qingbyin](https://github.com/qingbyin) 在博士期间制作的学位论文模板 [swputhesis](https://github.com/qingbyin/swputhesis)。在此表示感谢。

## 效果预览

示例 PDF 文件见 [swputhesis.pdf](https://github.com/sudrizzz/swputhesis/blob/main/swputhesis.pdf)。

![](./fig/%E8%AE%BA%E6%96%87%E9%A2%84%E8%A7%88%E5%9B%BE1.png)

---

![](./fig/%E8%AE%BA%E6%96%87%E9%A2%84%E8%A7%88%E5%9B%BE2.png)

## 前置条件

### 安装 TeXLive

请前往镜像站下载最新版 TeXLive，安装时可通过 customize 操作去除不需要的语言包（如韩语、德语等），以加快安装速度。

下载地址：[北京外国语大学镜像站](https://mirrors.bfsu.edu.cn/CTAN/systems/texlive/Images/)、[清华大学镜像站](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/)

## 使用方法

### 在 VSCode 中编译

**下述编译方式都已配置好，无需再次配置，直接使用即可。相关配置见项目路径下 `.vscode/settings.json`。**

点击 VSCode 菜单栏左上角的 **文件（File）** 按钮，选择 **打开文件夹（Open Folder）** 选项打开项目所在文件夹，即可开始使用项目。  
首先需要安装 [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件。打开 swputhesis.tex 时，左侧导航栏会出现 TeX 菜单。

- 使用 `latexmk` 编译  
  点击 TeX 菜单，选择 COMMANDS -> Build LaTeX Project -> **Recipe: latexmk** 即可编译。

- 使用 `xelatex` 编译  
  点击 TeX 菜单，选择 COMMANDS -> Build LaTeX Project -> **Recipe: xelatex -> biber -> xelatex\*2** 即可编译。

### 手动编译（较硬核，不推荐）

- 使用 `latexmk` 编译  
  执行如下命令即可编译。

```shell
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -xelatex swputhesis.tex
```

- 使用 `xelatex` 编译  
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

## 项目文件说明

| 文件或目录         | 说明                                                                                                                                                                                                   |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| swputhesis.tex     | 论文模板主文件，包含论文作者信息，通过引入相应的章节文件控制论文结构                                                                                                                                   |
| swputhesis.cls     | 论文模板样式文件，包含模板样式控制代码                                                                                                                                                                 |
| swputhesis.pdf     | 编译项目后得到的论文                                                                                                                                                                                   |
| clean.cmd          | Windows 批处理脚本，用于清理论文编译产生的中间文件                                                                                                                                                     |
| ref.bib            | 论文参考文献源文件，每个参考文献的 key 必须全局唯一，使用文献管理工具导出参考文献信息时，应选择 biblatex 格式导出                                                                                      |
| /fig               | 存放论文中所用到的图片，建议使用 PDF 或 PNG 格式保存图片                                                                                                                                               |
| /fig/pdfcrop.bat   | Windows 批处理脚本，用于裁剪 PDF 图片四周的多余空白。**以管理员身份执行使用该脚本**，需要输入一个整数用于确定待处理 PDF 图片数量，按照修改时间从最新到最老的顺序依次处理，处理后的文件将自动替换原文件 |
| /src               | 存放论文所用到各个子章节源文件                                                                                                                                                                         |
| /src/chapter\*.tex | 论文子章节源文件，如第一章、第二章等                                                                                                                                                                   |
| /src/abstract.tex  | 论文摘要源文件                                                                                                                                                                                         |
| /src/format.tex    | 论文模板使用说明，仅作参考使用。在正式使用本模板时，应注释 swputhesis.tex 中将该文件的引入语句 `\include{src/format}`                                                                                  |
| /src/ack.tex       | 论文致谢源文件                                                                                                                                                                                         |
| /src/resume.tex    | 攻读硕士学位期间发表的论文及科研成果                                                                                                                                                                   |
| /.vscode/\*        | 模板在 VSCode 中的配置文件，如无必要请勿修改                                                                                                                                                           |


## 已知问题

目前项目仍处于早期开发版本，欢迎提交 issue 和 pull request。

1. 由于学术硕士和专业硕士封面存在较大差异，建议使用 Word 单独制作封面；
2. 由于字体版权问题，目前本模板仅支持 Windows 平台（Windows 自带中易宋体（即宋体）与中易黑体（即黑体））。若要在 Linux 或 Unix 平台下使用本模板，请自行安装中易宋体与中易黑体。

## 免责申明

由于学校图书馆网站上说明只接受 Word 格式的学位论文文档（见[学位论文提交系统常见问题](https://lib.swpu.edu.cn/95_80/mason/0317x/faq.html?q=13#a)），本模板不能保证在提交学校审查时能一切顺利，请提前咨询相关负责老师。

## 参考资料

1. [一份不太简短的 LaTeX2ε 介绍](https://mirrors.bfsu.edu.cn/CTAN/info/lshort/chinese/lshort-zh-cn.pdf)
2. [北京理工大学非官方本科生毕业设计、毕业论文的 LaTeX 模板文档指南](https://bithesis.spencerwoo.com/Guide/2-Usage/Downloading-and-using-templates.html)
3. [在 LaTeX 中使用 OpenType 字体（二）](https://stone-zeng.github.io/2019-07-06-use-opentype-fonts-ii/)
