%%
%% This is file `swputhesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% swputhesis.dtx  (with options: `cls')
%%
%% This is a generated file.
%%
%% Copyright (C) 2019-2021 by Qing Yin <qingbyin@gmail.com>
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%%
% 指定本模板兼容的 \LaTeX 版本。
\NeedsTeXFormat{LaTeX2e}[2018/04/01]
% 定义模板名称
\ProvidesClass{swputhesis}
[2021/09/01 1.0.0 SWPU Thesis Template]
% 检查是否使用 \XeTeX 编译，若没有则报错。
\RequirePackage{ifxetex}
\ifxetex\else
\ClassError{swputhesis}{XeLaTeX is required to compile the document}{}
\fi

% 加载支持中文的文档类
% 设置正文字号：小四，使用UTF8编码；
% openany避免章节末产生空白页；
% 不使用默认中文字体；
% scheme = chinese设置图表采用中文名称。
\LoadClass[zihao=-4,UTF8,openany,fontset=none,scheme=chinese]{ctexbook}

% \pkg{fontspec} 已经在 ctexbook 里加载，但这里还需要额外配置。
% 设置 \pkg{fontspec}为不处理数学字体（no-math）。
% 因为默认情况下fontspec会将 \cs{mathrm} 的字体更改为 Times New Roman，
% ⽽ \cs{mathnormal} 依然为 Computer Modern Roman，⽐ Times New Roman 要细。
\PassOptionsToPackage{no-math}{fontspec}

% ^^A ==========================================================================
% 加载模板将使用到的宏包，由于宏包加载顺序会相互影响配置，因此在此处集中加载宏包，
% 并且不随意改变宏包加载顺序。
% 生成 PDF 标签需要 \pkg{hyperref} 宏包，但该宏包必须在所有宏包后加载才能正确应用，
% 因此该宏包不在这里加载，而应该在用户端的最后加载。
\RequirePackage{newtxmath} % 用于单独设置公式使用Times New Roman字体
\RequirePackage{xeCJKfntef} % 用于实现汉字下划线和盒子内两段对齐
\RequirePackage{fancyhdr} % 用于设置页眉页脚
\RequirePackage{geometry} % 用于设置页面大小、边距
\RequirePackage{pifont} % 实现脚注编号使用漂亮的带圈数字符号
\RequirePackage[perpage]{footmisc} % 实现让脚注每页清零编号
\RequirePackage{graphicx} % 插图导入支持
\RequirePackage{color}
\RequirePackage{caption} % 设置图表标题格式
\RequirePackage{booktabs} % 设置三线表
\RequirePackage{tocloft} % 设置目录格式
\RequirePackage{enumitem} % 设置列表格式
\RequirePackage{etoolbox} % dev tool
\RequirePackage[style=gb7714-2015]{biblatex} % 参考文献工具（使用国标）

% ^^A ==========================================================================
% 定义论文基本信息变量
% 定义用户输入参数接口：全局变量
% 批量定义关于封面信息的全局宏，使所有选项在 swpu 选项族下,并将内部宏转化为外部宏命令。
\def\swpu@def@prm#1#2{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname swpu@#1\endcsname{##1}%
  }%
  \csname #1\endcsname{#2}%
}
% 作者信息：中英文姓名、学科专业、研究方向、学号。
\swpu@def@prm{cauthor}{中文名}
% \swpu@def@prm{eauthor}{English Name}
\swpu@def@prm{cmajor}{学科专业中文名}
% \swpu@def@prm{emajor}{major}
\swpu@def@prm{research}{研究方向}
\swpu@def@prm{id}{学号}
% 论文中英文题目。
\swpu@def@prm{ctitle}{}
% \swpu@def@prm{etitle}{}
% 导师中英文姓名。
\swpu@def@prm{csupervisor}{}
% \swpu@def@prm{esupervisor}{}
% 论文完成日期（中英文）。
\swpu@def@prm{cdate}{}
% \swpu@def@prm{edate}{}
% 图书分类号。
\swpu@def@prm{clc}{}

% ^^A ==========================================================================
% 字体设置
% 已通过加载 \pkg{ctex} 宏包设置全文字号为小四。
% 已通过加载\pkg{newtxmath}宏包单独设置公式使用Times New Roman字体。
%
% 使用 \pkg{fontspec} 宏包设置正文英文字体。
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
% 利用 \pkg{ctex} 宏包设置中文字体。设置正文字体为思源宋体(SC:简体)；
% 设置 \cs{song} 为思源宋体； 设置 \cs{hei} 为思源黑体。
\setCJKmainfont{Source Han Serif CN}
\setCJKsansfont{Source Han Sans CN}
\setCJKmonofont{Source Han Sans CN} % 避免 warning
\setCJKfamilyfont{song}{Source Han Serif CN}
\setCJKfamilyfont{hei}{Source Han Sans CN}

% ^^A ==========================================================================
% 行距:1.25倍
\linespread{1.25}
% 字体、行距设置立即生效。
\selectfont
% TODO: Check that
% \LaTeX 和 Word 的行距的定义都是字底部到下一行字底部的距离（见刘海洋《\LaTeX 入门》p.82），
% 但后面设置，如章节、图表与正文间距时，需要用到字底部到下一行字顶部的距离。
% 因此定义该距离为 \cs{linegap}，在正文行距的基础上计算得到：（见刘海洋《\LaTeX 入门》p.83）
% \cs{swpu@linegap} = 1.25 * (1.2 * 12bp)  - 12 bp = 6 bp
\newcommand{\swpu@linegap}{6bp}

% ^^A ==========================================================================
% {页面设置}
% 利用 \pkg{geometry} 设置页面尺寸
% A4纸张;
% 四边页边距均为 2.5 cm；
% 设置页眉高度(box) 0.55 cm, 否则编译后会警告页眉高度过小；
% 页眉顶部到纸张顶部距离 1.5 cm，
% 而 \pkg{geometry} 只有页眉顶部到版面顶端的选项 \cs{headsep},
% 因此需要换算：headsep = 上边距2.5 - 页眉顶部到纸张顶部距离 1.5 - 页眉高度0.55 = 0.45 cm
% 页脚到纸张底部距离 1.75 cm，
% 也需要换算计算页脚到版式底部距离 footskip = 下边距2.5 - 1.75 = 0.75 cm
\geometry{
  paper      = a4paper,
  margin     = 2.5cm,
  headheight = 0.55cm,
  headsep    = 0.45cm,
  footskip   = 0.75cm
}

% ^^A ==========================================================================
% 利用 \pkg{fancyhdr} 设置正文前和正文中页眉页脚内容。
%
% 摘要目录页 (frontmatter) 无页眉，页码小五号，罗马数字，Time New Roman，居中。
% 定义对应的 plain 样式。
\fancypagestyle{plain}{%
  % 清除所有页眉页脚。
  \fancyhf{}
  % 设置页码小五号
  \cfoot{\zihao{-5}\selectfont\thepage}
  % 无页眉线
  \renewcommand{\headrulewidth}{0bp}
}

% 正文页眉五号宋体居中；页码小五号，阿拉伯数字，Times New Roman，居中。
% 定义对应的 headings 样式。
% Note: 不要重定义 fancy 风格， 会导致编译时卡住。
\fancypagestyle{headings}{%
  % 清除所有页眉页脚。
  \fancyhf{}
  % 奇数页(O)页眉居中(C), 五号宋体。
  \fancyhead[CO]{\zihao{5}\CJKfamily{song}\selectfont 西南石油大学专业学位硕士研究生学位论文}
  % 偶数页(E)居中(C)页眉, 五号宋体。
  \fancyhead[CE]{\zihao{5}\CJKfamily{song}\selectfont \swpu@ctitle}
  % 页眉线宽 1.5 bp。
  \renewcommand{\headrulewidth}{1.5bp}
  % 页码小五号
  \cfoot{\zihao{-5}\selectfont\thepage}
}

% 应用上述自定义的页眉页脚样式到相应的部分。
%
% 摘要、目录、物理量名称及符号表 (frontmatter) 使用自定义的 plain 样式。
\renewcommand{\frontmatter}{%
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman} % 页码使用大写罗马数字
  \pagestyle{plain}
}
% 正文页使用自定义的 headings 样式。
\renewcommand{\mainmatter}{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic} % 页码使用阿拉伯数字
  \pagestyle{headings}
}
% 每章第一页默认会设置特殊的 page style，设置它与其他正文页眉页码相同
\ctexset{chapter/pagestyle=headings}

% ^^A ==========================================================================
% {封面和封底}
%
% {中文封面}
% 论文信息表标题栏：黑体 (英文Arial)， 小三。
% 注意 parbox 必须指定 contentpos，否则会出现并排的 box 错位的现象。
\newcommand{\swpu@zhcoverformat}[3]{%
  \parbox[#1][#2][c]{3.5cm}{
    \zihao{-3}\sffamily\bfseries\selectfont
    \makebox[3.2cm][s]{#3 }
  }
}

% 论文信息表用户填写内容：黑体 (英文Arial)，四号 (14 bp)，左对齐，字符间距加宽 3 bp,
% 因为 ctex 宏包字符间距使用的字号的倍数，因此需要换算为倍数 3 / 14 = 0.21。
% 但可能是因为 ctex 定义中文间距是前一个汉字右边缘到后一个汉字左边缘距离，
% 而 Word 可能是中心距离， 因此实际数值应该比这个值大。
% 另外注意 ziju 只能调整中文间距， 对英文间距无影响。
% 下划线、蓝色（RGB：0,108/255,165/255）
% 注意 parbox 必须指定 contentpos，否则会出现并排的 box 错位的现象。
\newcommand{\swpu@zhinfoformat}[3]{%
  \parbox[#1][#2][c]{7.3cm}{%
    \zihao{4}\ziju{0.3}\sffamily%
    \linespread{1.7}\selectfont
    \CJKunderline[thickness=1bp, format=\color[rgb]{0,0.424,0.647}, textformat=\color[rgb]{0,0.424,0.647}]{#3 \hfill}
  }%
}

% 定义生成中文封面的宏命令。
% 顶部信息: 黑体五号加粗，英文Arial。
% 图片的基线在其底部，为了和字体对齐，我们需要用 \cs{vcenter} 调整其基线到中部。
\newcommand{\swpu@makezhtitle}{%
  {\zihao{5}\sffamily\bfseries\selectfont
  $\vcenter{\hbox{\includegraphics[height=1.94cm]{fig/swpu_logo.jpg}}}$%
  \hspace{0.68cm}%
  图书分类号：\swpu@clc\hfill%
  学校代码：10615
  \vspace{2.2cm}\par}
  \includegraphics[height=1.22cm]{fig/swpu.jpg} % 学校图片
  \vspace{0.83cm}\par
  % \includegraphics[height=1.83cm]{fig/doctor_thesis_logo.jpg} % 学位论文图片
  \includegraphics{fig/master_thesis_logo.jpg} % 学位论文图片 
  \vspace{2cm}\par
  % 论文信息。不用表格，因为表格不好调单元高度，也不好设置垂直对齐方式。
  % \hspace{2em}
  \swpu@zhcoverformat{t}{2cm}{论文题目}%
  \swpu@zhinfoformat{t}{2cm}{\swpu@ctitle}

  \swpu@zhcoverformat{b}{1cm}{学科专业}%
  \swpu@zhinfoformat{b}{1cm}{\swpu@cmajor}

  \swpu@zhcoverformat{b}{1cm}{研究方向}%
  \swpu@zhinfoformat{b}{1cm}{\swpu@research}

  \swpu@zhcoverformat{b}{1cm}{研究生姓名}%
  \swpu@zhinfoformat{b}{1cm}{\swpu@cauthor}

  % 因中文间距设置不影响西文，必须额外加西文间距。
  \swpu@zhcoverformat{b}{1cm}{学号}%
  \swpu@zhinfoformat{b}{1cm}{\addfontfeatures{LetterSpace=12}\swpu@id}

  \swpu@zhcoverformat{b}{1cm}{导师姓名}%
  \swpu@zhinfoformat{b}{1cm}{\swpu@csupervisor}

  \vspace{3.7cm}\par
  % 日期：黑体(英文Arial)，小三 (15 bp)，字体加宽 3 bp，换算为倍数 3 / 15 = 0.2 (要微调)
  {\zihao{-3}\ziju{0.3}\sffamily\selectfont 论文完成时间：\swpu@cdate}
}

% % 定义生成英文封面的宏命令。
% \newcommand{\swpu@makeentitle}{%
%   {\quad}\vspace{2cm}\par
%   {\zihao{1}\selectfont % 一号字体
%   Southwest Petroleum University\par
%   Doctoral Dissertation\par}
%   \vspace{5.2cm}\par
%   {\zihao{2}\selectfont
%   % 英文题目：二号字体，全部大写，Times New Roman
%   \swpu@etitle}
%   \vspace{5.2cm}\par
%   % 英文信息：小三，Times New Roman
%   {\zihao{-3}\selectfont
%   \begin{tabular}{l}
%   Candidate: \swpu@eauthor\par  \\
%   Speciality: \swpu@emajor\par  \\
%   Supervisor: \swpu@esupervisor\par
%   \end{tabular}

%   \vspace{2cm}\par
%   \swpu@edate
%   }%
% }

% 知识产权声明
\newcommand{\swpu@makecopyright}{%
  \quad\par
  \quad\par
  \begin{center}
  \sffamily\selectfont
  西南石油大学研究生学位论文知识产权声明书及 \par 学位论文版权使用授权书
  \end{center}
  \hspace{2\ccwd}本人完全了解学校有关保护知识产权的规定，
  即：研究生在校攻读学位期间论文工作的知识产权单位属于西南石油大学。
  学校有权保留并向国家有关部门或机构送交论文的复印件和电子版。
  本人允许论文被查阅和借阅。学校可以将本学位论文的全部或部分内容编入有关数据库进行检索，
  可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。
  同时，本人保证，毕业后结合学位论文研究课题再撰写的文章一律注明作者单位为西南石油大学。\par
  本学位论文属于\par
  1、保密（\hspace{2\ccwd}），在\hspace{2\ccwd}年解密后适用本授权书。\par
  2、不保密（ \hspace{2\ccwd}）\par
  (请在以上相应括号内打 `` √ ''）\par
  \quad\par
  \hspace{7.5\ccwd}学位论文作者签名：\underline{\hspace{6\ccwd}}%
  指导教师签名：\underline{\hspace{6\ccwd}}\par
  \hspace{11.5\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日%
  \hspace{6\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日\par
  \quad\par
  \quad\par
  \quad\par
  \begin{center}
  \sffamily\selectfont
  西南石油大学研究生学位论文独创性声明\par
  \end{center}
  \hspace{2\ccwd}本人声明：所呈交的研究生学位论文是本人在导师指导下进行的研究工作及取得的研究成果。
  据我所知，除了文中特别加以标注和致谢的地方外，本论文不包含其他人已经发表或撰写过的研究成果，
  也不包含其他人为获得西南石油大学或其它教育机构的学位或证书而使用过的材料。
  与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。\par
  \quad\par
  \quad\par
  \hspace{14\ccwd}学位论文作者签名：\par
  \hspace{17\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日
}

% 定义 \cs{makecover}，调用 \cs{swpu@makezhtitle}, \cs{swpu@makeentitle}
% 分别生成中、英文封面。
\def\makecover{%
  \pagestyle{empty}
  \begin{titlepage}
  \centering
  \swpu@makezhtitle
  \clearpage
%   \swpu@makeentitle
  \end{titlepage}
  \swpu@makecopyright
}

% 定义摘要关键词（中英文）。
\swpu@def@prm{ckeywords}{}
\swpu@def@prm{ekeywords}{}

% 中文摘要。

\newenvironment{cabstract}{\chapter*{摘\hspace{\ccwd}要}}{%
  % 设置无页眉有页码, 注意必须使用 thispagestyle 设置才有效。
  \thispagestyle{plain}
  % 关键字：隔一行，顶格，黑体
  \quad\par
  \noindent\textsf{关键词：} \swpu@ckeywords
  \clearpage
}

% 英语摘要。
\newenvironment{eabstract}{\chapter*{Abstract}}{%
  % 设置无页眉有页码, 注意必须使用 thispagestyle 设置才有效。
  \thispagestyle{plain}
  % 关键字：隔一行，顶格
  \quad\par
  \noindent \textbf{Key words：} \swpu@ekeywords
  \clearpage
}

% ^^A ==========================================================================
% {目录}
% 在目录中只显示三级章节标题, 即1.1.1
\setcounter{tocdepth}{2}
% 使用 \pkg{tocloft} 设置目录格式。
% 目录项前面的引导点默认是西文的句号，它与基线平齐。而中文排版需要将其修改为居中的中文省略号。
\renewcommand{\cftdot}{…}
\renewcommand{\cftdotsep}{0}
% 修改目录标题与章标题格式相同：小二，黑体 (英文Arial)，居中
% 段前 24 bp, 段后 18 bp (学校未规定）
\renewcommand{\contentsname}{目\hspace{\ccwd}录}
\renewcommand{\cfttoctitlefont}{\hfill\zihao{-2}\sffamily}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforetoctitleskip}{24 bp}
\renewcommand{\cftaftertoctitleskip}{18 bp}
% 章标题：小四，黑体 (英文 Arial)，1.25倍行距； 设置页号不加粗，设置引线
\renewcommand{\cftchapfont}{\zihao{-4}\sffamily}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchappagefont}{\normalfont} % 取消页码加粗
\renewcommand{\cftbeforechapskip}{0bp} % 取消章节的段前距离
% 一级节标题：小四，宋体 (英文 Times New Roman)，1.25倍行距。
\renewcommand{\cftsecfont}{\zihao{-4}}
\renewcommand{\cftbeforesecskip}{0bp} % 取消段前距离
% 二级节标题：小四，宋体 (英文 Times New Roman)，1.25倍行距。
\renewcommand{\cftsubsecfont}{\zihao{-4}}
\renewcommand{\cftbeforesubsecskip}{0bp} % 取消段前距离

% ^^A ==========================================================================
% {章节标题}
% 最多允许两级节标题编号, 即1.1.1
\setcounter{secnumdepth}{2}
% 章标题:小二，黑体 (英文Arial)，居中，1.25 倍行距 (只影响标题内行距，不影响标题与正文的行距)
% (注: LaTeX 的章节行距不影响段前段后间距，而 Word 的行距设置会影响段前段后距离)；
% 段前 24 bp, 段后 18 bp (学校未规定）；章序号与章节名间空一字。
\ctexset{
  chapter = {
    % 注：若要调整行距 linespread, 还需要额外加 selectfont 才能生效。
    format = \zihao{-2}\sffamily\centering,
    % 清除单独设置章节名和随后标题内容的格式。
    nameformat = {},
    numberformat = {},
    titleformat = {},
    % 章节名与其后标题内容间的间距：1个汉字字符。
    aftername = \hspace{\ccwd},
    name = {第,章},
    beforeskip = 24 bp, % 段前间距
    afterskip = 18 bp, % 段后间距
    % book类的标题与正文的距离除了由 beforeskip 和 afterskip 选项设置的垂直间距外
    % 还会有一些多余的间距(该间距大小受行距影响)，fixskip 选项用于抑制这些多余间距。
    fixskip = true,
    afterindent = true % 设置章标题后首段缩进
  }
}

% 一级节标题：小三，黑体，左顶格，1.25 倍行距，段前 24 bp，段后与正文行距相同 (6 bp)；
% 但不抑制自动增加的段前段后多余的垂直间距，这样能稍大于正文行距离。
% 章序号与章节名间空一字。
\ctexset{
  section = {
    format = \zihao{-3}\sffamily\raggedright,
    aftername = \hspace{\ccwd}, % 节名与其后标题内容间的间距：1个汉字字符。
    beforeskip = 24 bp,
    afterskip = \swpu@linegap,
    fixskip = false, % 不抑制多余的垂直间距。
    afterindent = true % 设置节标题后首段缩进。
  }
}

% 二级节标题：四号，黑体，左顶格，1.25 倍行距，
% 段前 12 bp，段后与正文行距相同 (6 bp)；
% 但不抑制自动增加的段前段后多余的垂直间距，这样能稍大于正文行距离。
% 章序号与章节名间空一字。
\ctexset{
  subsection = {
    format = \zihao{4}\sffamily\raggedright,
    aftername = \hspace{\ccwd}, % 节名与其后标题内容间的间距：1个汉字字符。
    beforeskip =12 bp,
    afterskip = \swpu@linegap,
    fixskip = false, % 不抑制多余的垂直间距。
    afterindent = true % 设置节标题后首段缩进。
  }
}

% 三级节标题：小四号，黑体，左顶格，1.25 倍行距 (只影响标题内行距，不影响标题与正文的行距)
% 段前 6 bp，段后 6 bp, 抑制多余的垂直间距，
% 这样就等价于设置：无段前段后并与正文内容为 1.25 倍行距；
% 章序号与章节名间空一字。
\ctexset{
  subsubsection = {
    format = \zihao{-4}\sffamily\raggedright,
    aftername = \hspace{\ccwd}, % 节名与其后标题内容间的间距：1个汉字字符。
    beforeskip = \swpu@linegap,
    afterskip = \swpu@linegap,
    fixskip = true, % 抑制多余的垂直间距。(保持为行间距)
    afterindent = true % 设置节标题后首段缩进。
  }
}

% ^^A ==========================================================================
% {正文格式}
%
% 全文首行缩进 2 字符，标点符号用全角。
\ctexset{%
  punct=quanjiao,
  space=auto,
  autoindent=true
}
% 禁止扩大段间距。
% 并且修复 `` Underfull \cs{vbox} (badness 10000)  ‘’ warning
\raggedbottom
\setlength{\parskip}{\z@} % 段间距 0 磅

% \pkg{pitfont} 实现带圈脚注，另外LaTeX 默认脚注按章计数，即每章的开始才重置脚注计数器，
% 使用的 \pkg{footmisc} 会使每页脚注编号清零。
\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}

% ^^A ==========================================================================
% \pkg{caption} 宏包设置图表标题格式。
% 定义用于设置编号和标题内容字符间距的 caption 内部命令。
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
% 设置图表编号用 - 连接。
\renewcommand*{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand*{\thetable}{\thechapter-\arabic{table}}
\captionsetup{
  format = hang, % 多行缩进
  font = small, % 五号（正文小四，对应的small size是五号），宋体
  labelsep = zhspace, % 编号和标题内容间隔一个中文字符
  % 不要在这里设置图名称，利用 ctex 设置，即 scheme = chinese。
  % 因为这里设置的话会导致使用 biblatex 报错，
  % 要避免这个报错必须在导入 biblatex 前加命令个修正命令
  % 见 \url{https://github.com/CTeX-org/ctex-kit/issues/380}
  % 实在要改动也应该在 ctexsetup 里设置，见 ctex 文档
  % ^^A	figurename = 图,
  % ^^A	tablename = 表,
  skip = \swpu@linegap % 图表与其标题间的垂直距离: 与正文行间的距离相同
}
% 设置表格内字体为5号
\patchcmd\@floatboxreset{\normalsize}{\small}{}{Failed to set float font}

% 注意图表底部自动加入了额外的间距，因此不需要再设置段后距离。
% 图表（使用插入模式：h）与其顶部、底部正文距离(除去额外间距)：与正文行间的距离相同。
\setlength{\intextsep}{\swpu@linegap}
% 设置（浮动模式）与其顶部、底部正文距离(除去额外间距)：与正文行间的距离相同
\setlength{\textfloatsep}{\swpu@linegap}
% 设置两图表（浮动模式）之间的距离(除去额外间距)：与正文行间的距离相同
\setlength{\floatsep}{\swpu@linegap}

% ^^A ==========================================================================
% {公式}
% 设置公式编号用 - 连接。
\renewcommand*{\theequation}{\thechapter-\arabic{equation}}
% 设置公式段前段后距离。
% 这里有两种段前段后 displayskip 和 displayshortskip，
% 公式前一行文字会影响公式选择哪一种段前段后 (见 Mathmode 文档)。
% 当小于公式前缩进的空白长度，会采用 displayshortskip 设置公式的段前段后距离。
% 这可能是因当文字小于公式前缩进的空白长度时，这些空白会给人感觉段间距变大了，
% 因此采用一个较小的段间距参数。
% \textbf{注意：} \cs{normalsize} 在执行时会重置公式的段前段后参数设置，导致设置失效。
% 有几种办法解决：
% 1. 在 normalsize 执行后再修改这些参数；
% 2. 重定义 normalsize，在里面定义字体的同时将公式段前段后设置为正确值；
% 3. 将公式段前段后设置的参数传递给 normalsize。
% 这里采用第一种方法。
\AtBeginDocument{%
  \abovedisplayskip = 12bp \@plus 3bp \@minus 7bp
  \belowdisplayskip = \abovedisplayskip
  % 当公式上方一行文字的长度短于公式前缩进的空白长度时的段前距
  \abovedisplayshortskip = 0 bp \@plus 3bp
  % 当公式上方一行文字的长度短于公式前缩进的空白长度时的段后距
  \belowdisplayshortskip = 6.5bp \@plus 3.5bp \@minus 3bp
}

% ^^A ==========================================================================
% {列表}
% 设置列表格式与正文相同，首行缩进两字符，列表无段前段后距离。
\setlist{wide,noitemsep,nosep}
\setlist[enumerate]{label=(\arabic*)} % 采用括号数字

% ^^A ==========================================================================
% {其他宏包的设置}
% 这些宏包并非格式要求，但是为了方便使用，在这里进行简单设置。
% 这些宏包并未在模板里加载，需要在用户端加载，加载后自动设置下面预设的参数。
%
% 定义宏包末尾钩子： 与 filehook 的 \cs{AtEndOfPackageFile*} 类似
% 如果原来没有在载入宏包则在宏包末尾执行语句，否则立即执行
\newcommand\swpu@atendpackage{\csname ctex_at_end_package:nn\endcsname}

% \subsubsection{\pkg{hyperref} 宏包}
\swpu@atendpackage{hyperref}{
  % PDF 标签设置
  \hypersetup{
    bookmarksopen      = true, % 开启书签
    bookmarksnumbered  = true, % 目录书签带编号
    bookmarksopenlevel = 1, % 默认展开章层次
    linktoc            = all, % 目录中的章节标题、页码全部链接到对应页面
  }
  % 超链接样式设置, 无边框，黑色。
  \hypersetup{
    colorlinks = true,
    allcolors  = black
  }
  % 根据论文信息填写 PDF 个人信息。
  \AtBeginDocument{
    \hypersetup{
      pdftitle = \swpu@ctitle,
      pdfauthor = \swpu@cauthor
    }
  }
}

% {\pkg{cleveref} 宏包}
% 设置中文图表、公式的文中引用，该宏包应该在 \pkg{hyperref} 之后加载。
\swpu@atendpackage{cleveref}{
  % 公式设置
  \crefformat{equation}{公式(#2#1#3)}
  \crefrangeformat{equation}{公式(#3#1#4) 至 (#5#2#6)}
  \crefmultiformat{equation}{公式(#2#1#3)}{和(#2#1#3)}{，(#2#1#3)}{和(#2#1#3)}
  % 图设置
  \crefformat{figure}{图~#2#1#3}
  \crefrangeformat{figure}{图~#3#1#4 至 #5#2#6}
  \crefmultiformat{figure}{图~#2#1#3}{ 和~#2#1#3}{，#2#1#3}{ 和~#2#1#3}
  % 表设置
  \crefformat{table}{表~#2#1#3}
  \crefrangeformat{table}{表~#3#1#4 至 #5#2#6}
  \crefmultiformat{table}{表~#2#1#3}{ 和~#2#1#3}{，#2#1#3}{ 和~#2#1#3}
}
\endinput
%%
%% End of file `swputhesis.cls'.
