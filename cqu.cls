%% This is file `cqu.cls',based on article styles and thuthesis styles( 清华大学模板).
%% Copyright (C) 2009-2010 by G.C. Xie <man.xiegc@gmail.com>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cqu}[20010/01/05 V1.05 Chongqing University Thesis Template for LaTeX2e]
\LoadClass{article}

\newif\if@bachelor\@bachelorfalse
\newif\if@master\@masterfalse
\newif\if@doctor\@doctorfalse
\DeclareOption{bachelor}{\@bachelortrue}
\DeclareOption{master}{\@mastertrue}
\DeclareOption{doctor}{\@doctortrue}
\newif\if@xecjk
\newif\if@zhcjk
\newif\if@latex
\newif\if@pdftex
\DeclareOption{pdftex}{\@pdftextrue}
\DeclareOption{xecjk}{\@xecjktrue}
\DeclareOption{zhspacing}{\@zhcjktrue}
\DeclareOption{latex}{\@latextrue}
\newif\if@science
\newif\if@arts
\DeclareOption{science}{\@sciencetrue}
\DeclareOption{arts}{\@artstrue}
\newif\if@oneside
\newif\if@twoside
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\ExecuteOptions{oneside,science}
\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%%%%%%模板类型设置
\if@bachelor\relax\else
  \if@master\relax\else
    \if@doctor\relax\else
      \ClassError{cqu}%
       {You have to specify one of thesis options:
       bachelor, master or doctor.}{}
    \fi
  \fi
\fi
\if@xecjk\relax\else
  \if@pdftex\relax\else
    \if@latex\relax\else
      \if@zhcjk\relax\else
        \ClassError{cqu}%
            {You have to specify one of thesis options:
             xecjk,zhspacing,pdftex or latex.}{}
      \fi
    \fi
  \fi
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%装载用到的宏包%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen,calc}
\RequirePackage{amsmath,amsfonts,amssymb}  %用来排出漂亮的公式
\RequirePackage{amsthm}
\RequirePackage{txfonts,bbding,mathcomp}%包括常用的数学、物理符号的包
\RequirePackage{color,fancybox}
\RequirePackage{graphicx,float}% 图形支持宏包
\RequirePackage{subfig}  %%用来排布含几个子图形的图形
\RequirePackage{longtable}%%排布跨页长表格
\RequirePackage{multirow}
\RequirePackage[chatter]{rotating}%%用来旋转较宽的表格
\RequirePackage{booktabs,tabularx}%%适合作对线条有特殊要求的表格
\RequirePackage{caption}[2008/04/01]
\RequirePackage{setspace}
\RequirePackage{url,mdwlist}%更好的列表环境
\RequirePackage[super,sort&compress]{natbib}
%\RequirePackage{hypernat}
\RequirePackage{hyperref}
%%%%%%%%%%%%%%%%%%%%%%%%%%%驱动选项设置
\RequirePackage{ifpdf,ifxetex}
\if@xecjk\RequireXeTeX\fi
\if@zhcjk\RequireXeTeX\fi
\if@zhcjk
  \RequirePackage{fontspec,xltxtra,xunicode}% 这里使用 xetex 相应的宏包
   \RequirePackage{zhfont,zhmath}        % 中文支持使用zhspacing
   \zhspacing
   \setzhmainfont[BoldFont=文泉驿等宽正黑]{SimSun}%这里设置中文粗体和普通字体
   \setmainfont{Times New Roman}       %这里设置英文衬线字体
   \setmonofont{FreeMono}              %英文等宽字体
   \setsansfont{FreeMono}              %英文无衬线字体
   \def\hei#1{{\bfseries{#1}}}         %黑体
   \else
   \if@xecjk
     \RequirePackage{xunicode,xltxtra}
     \RequirePackage[CJKnumber,CJKtextspaces,CJKmathspaces]{xeCJK}
     \punctstyle{kaiming} %标点格式 or kaiming
     \defaultfontfeatures{Mapping=tex-text} % after fontspec
     \setCJKmainfont[BoldFont={文泉驿等宽正黑}]{SimSun}
     \setCJKsansfont{文泉驿等宽正黑}
     \setCJKmonofont{AR PL KaitiM GB}
     \setCJKfamilyfont{song}{SimSun}
     \setCJKfamilyfont{hei}{文泉驿等宽正黑}
     \setCJKfamilyfont{kai}{AR PL KaitiM GB}
     \setmainfont{Times New Roman}
     \setsansfont{FreeMono}
     \setmonofont{Courier New}
     \newcommand{\song}[1]{{\CJKfamily{song}{#1}}} % 宋体
     \newcommand{\kai}[1]{{\CJKfamily{kai}{#1}}}   % 楷体
     \newcommand{\hei}[1]{{\CJKfamily{hei}{#1}}}   % 黑体
     \else
     %\RequirePackage{ccmap}
     \RequirePackage{CJKutf8}
     \RequirePackage{CJKnumb}
     \RequirePackage{CJKspace}
     \newcommand{\song}[1]{{\CJKfamily{song8}{#1}}} % 宋体
     \newcommand{\kai}[1]{{\CJKfamily{kai8}{#1}}}   % 楷体
     \newcommand{\hei}[1]{{\CJKfamily{hei8}{#1}}}   % 黑体
   \fi
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%字体设置%%%%%%%%%%%%%%%%%%%%%%%%%%%
%文档正文主字体为宋体（simsun），粗体和黑体为（文泉驿等宽正黑），另有楷体
%定义了几种常用的字号：二号、小二号、三号、小三号、四号、小四号五号和小五号等
%正文小四号，固定行距为20磅
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%常用中文字号
\newcommand{\erhao}{\fontsize{22bp}{\baselineskip}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18bp}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16bp}{\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15bp}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14bp}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12bp}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5bp}{\baselineskip}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9bp}{\baselineskip}\selectfont}
\newcommand{\chuhao}{\fontsize{42bp}{\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36bp}{\baselineskip}\selectfont}
\newcommand{\xiaoyihao}{\fontsize{24bp}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26bp}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5bp}{\baselineskip}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5bp}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.5bp}{\baselineskip}\selectfont}
\newcommand{\xiaoqihao}{\fontsize{5bp}{\baselineskip}\selectfont}
%%%%%正文小四号，行距固定为20磅
\renewcommand\normalsize{%
      \@setfontsize\normalsize{12bp}{20bp}
      \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
      \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
      \belowdisplayskip=\abovedisplayskip
      \belowdisplayshortskip=\abovedisplayshortskip}
\newlength{\hangju}
\setlength{\hangju}{20bp \@plus.2ex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%页面格式设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%页面各边距根据学校论文要求的边距设置,可微调
%%页眉：左侧显示“重庆大学本科学生毕业设计 （论文）”，右侧为该节（section）名称，
%%页眉下有一宽度为0.8pt的直线
%%页脚：居中显示该页页码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\if@bachelor
    \geometry{a4paper,left=3.5cm,right=2.5cm,%
         top=3.0cm,headheight=1.6cm,headsep=1cm,%
         bottom=2.5cm,footskip=1cm}
    \else
    \geometry{a4paper,left=3.5cm,right=2.5cm,%
         top=3.0cm,headheight=1.6cm,headsep=1cm,%
         bottom=2.5cm,footskip=1cm}
\fi
%%%%%页眉和页脚设置
\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\headrulewidth}{0.8pt}
\lhead{\xiaowuhao 重庆大学本科学生毕业设计 （论文）}
\rhead{\xiaowuhao \leftmark}
\if@master
    \lhead{\wuhao 重庆大学硕士学位论文}
    \rhead{\wuhao \leftmark}
\fi
\if@doctor
    \lhead{\wuhao 重庆大学博士学位论文}
    \rhead{\wuhao \leftmark}
\fi
\if@twoside
    \lhead{}\rhead{}
    \fancyhead[EC]{\xiaowuhao \leftmark}
    \fancyhead[OC]{\xiaowuhao 重庆大学本科学生毕业设计 （论文）}
    \if@master
      \fancyhead[OC]{\wuhao 重庆大学硕士学位论文}
      \fancyhead[EC]{\wuhao \leftmark}
    \fi
    \if@doctor
      \fancyhead[OC]{\wuhao 重庆大学博士学位论文}
      \fancyhead[EC]{\wuhao \leftmark}
    \fi
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%正文设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%章节标题：最多三级，即X.X.X;第一级section，三号黑体居中，与上文间距2个中文字符，与下
%%文间距1个中文字符;第二级subsection，小三号黑体居左;第三级subsubsection，四号黑体居左
%%段落缩进：2个中文字符
%%脚注：以带圈阿拉伯数字编号，按页编号
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%段落首行缩进2个中文字符
\RequirePackage{indentfirst}
\parindent 2.3em
\setlength{\parskip}{0pt \@plus2pt \@minus0pt} %段落间距
%%%脚注按页编号
\RequirePackage{footnpag}
\renewcommand{\thefootnote}{%
     \scriptsize\textcircled{\tiny\arabic{footnote}}} 
%%%章节标题设置
\renewcommand\section{\@startsection {section}{1}{\z@}%
       {-3.5ex \@plus -1ex \@minus -.2ex}%
       {\hangju}%
       {\if@bachelor \vspace*{\hangju}
           \else
           \vspace*{0ex}
        \fi
       \centering\normalfont\sanhao\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
       {-20bp \@plus -1ex \@minus -.2ex}%
       {1bp  \@plus .2ex}%
       {\raggedright\normalfont\xiaosanhao\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
       {-1bp \@plus -1ex \@minus -.2ex}%
       {1bp  \@plus .2ex}%
       {\raggedright\normalfont\sihao\bfseries}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%目录设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%利用\printcontent输出目录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@dotsep{1} % 目录点间的距离
\renewcommand*\l@section[2]{%
  \ifnum 1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip 0em\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent 0em\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima 1em\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\sihao \bf #1}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
    \nobreak{\normalfont \normalcolor #2}%
    \par}%
  \fi}
\renewcommand*\l@subsection[2]{%
  \ifnum 2>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip 1em\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent 1em\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima 1.5em\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\wuhao \bf #1}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
    \nobreak{\normalfont \normalcolor #2}%
    \par}%
  \fi}
\renewcommand*\l@subsubsection[2]{%
  \ifnum 3>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip 1.6em\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent 1.6em\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima 2em\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\wuhao #1}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
    \nobreak{\normalfont \normalcolor #2}%
    \par}%
  \fi}
%%重新定义生成目录
\renewcommand\tableofcontents{\newpage%
   \if@bachelor \vspace*{-2\hangju}
     \else \vspace*{-\hangju}
   \fi % 
   \section*{\contentsname\@mkboth{目录}{}}%
    \@starttoc{toc}%
}
%列表和图像目录
\renewcommand\listoffigures{\newpage%
   \if@bachelor \vspace*{-2\hangju}
     \else \vspace*{-\hangju}
   \fi % 
   \section*{\listfigurename}%
    \@starttoc{lof}}
\renewcommand\listoftables{%
   \section*{\listtablename}%
    \@starttoc{lot}%
}

%%%%%%中文标题定义
\renewcommand{\refname}{参\quad 考\quad 文\quad 献}
\renewcommand{\contentsname}{\centerline{%
     \bf{\sanhao{目\qquad 录}}}}
\renewcommand{\listfigurename}{\centerline{%
     \bf{\sanhao{插\quad 图\quad 清\quad 单}}}}
\renewcommand{\listtablename}{\centerline{%
     \bf{\sanhao{附\quad 表\quad 清\quad 单}}}}
\newcommand{\listequationname}{\bf{%
     \sanhao{公\quad 式\quad 索\quad 引}}}
\newcommand{\equationname}{公式}
\renewcommand{\indexname}{索引}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\appendixname}{附录}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%浮动对象设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%提供了排布一般图形和表格，含子图形的图形和并列图形或表格的各种浮动对象环境
%%表格环境：mytable，标题在上，使用中英文标题的命令是\tabcaptionwithen
%%图形环境：figure，标题在下，使用中英文标题的命令是\figcaptionwithen
%%并列图形：twofigures，用来排布并列的两个图形
%%子图形：subfigure，具体用法参见subfig宏包文档
%%利用sidewaystable环境和\rotcaption命令，可用来旋转较宽的表格
%%使用longtable环境来布跨页长表格
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\numberwithin{table}{section}
\numberwithin{figure}{section}
\newcommand{\entablename}{Table}
\newcommand{\enfigurename}{Figure}


%\newcounter{tabnote}
%\stepcounter{tabnote}
%\newcommand{\tabnote}{\textsuperscript{\thetabnote}}
%\newcommand{\tabnote}[1]{\tabnote #1}

\DeclareCaptionFont{wuhao}{\wuhao}
\captionsetup{labelsep=quad,%
              justification=centering,%
              font=wuhao} %%一般的caption样式
%%%%%表格环境名称 mytable
\newenvironment{mytable}{%
     \floatstyle{plaintop}\restylefloat{table}%
     \begin{table}[H]\centering\wuhao}%
     {\end{table}}
\DeclareCaptionLabelFormat{sectiontab}{%
         \tablename ~ \thetable}
\captionsetup[table]{labelformat=sectiontab,%
                     belowskip=6bp,%
                     aboveskip={12bp-\intextsep}}%% 表格的caption样式
\newcommand{\tabcaptionwithen}[2]{%\vspace*{-0.8em} %
        \addtocounter{table}{1}\centering\wuhao %
        \tablename ~ \thetable\quad #1% 
        \\\entablename ~ \thetable ~ #2%
        \\} %%中英文表格标题

%说明：排布表格中的脚注时，可以将脚注内容当作表格内容置于
%表末处理，符号为\textsuperscript{*}，当然也可以使用threeparttable宏包
%%%%%图片环境名称 figure
\DeclareCaptionLabelFormat{sectionfig}{%
         \figurename ~ \thefigure}
\captionsetup[figure]{labelformat=sectionfig,%
                      belowskip={12bp-\intextsep},%
                      aboveskip=6bp}%% 图片的caption样式
\captionsetup[subfloat]{font=small,%
                        labelformat=parens,%
                        labelsep=space,%
                        farskip=1ex}%% 子图的caption样式
\newcommand{\figcaptionwithen}[2]{%
         \\\addtocounter{figure}{1}%
         \centering\wuhao%
         \figurename ~ \thefigure\quad #1%
         \\\enfigurename ~ \thefigure ~ #2%
         \vspace*{-0.7em}}%%中英文图像标题
\newenvironment{twofigures}[2]{  %%两个并列图形环境
\begin{figure}
  \begin{minipage}[t]{0.45\textwidth}%
   \centering #1%
  \end{minipage}%
  \qquad
  \begin{minipage}[t]{0.45\textwidth}%
   \centering #2%
  \end{minipage}%
\end{figure}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%标题页设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%有指导教师的将下面相关代码前的”%“号去掉
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\cntitlename{\bf{\xiaoerhao 重庆大学本科学生毕业设计（论文）}}
\def\entitlename{\textbf{\xiaoerhao Graduation Design(Thesis) of Chongqing University}}
%\def\entitlename{\textbf{\xiaoerhao }
%\def\entitlename{\textbf{\xiaoerhao }
\newtoks\cntitle  %%论文题目
\newtoks\entitle
\newtoks\cnauthor %%作者
\newtoks\enauthor
\newtoks\xuehao   %%学号
\newtoks\cnmajor %%专业
\newtoks\enmajor
\newtoks\cnteacher %%指导教师
\newtoks\enteacher
\newtoks\cnxueyuan %%学院
\newtoks\enxueyuan

\newtoks\enzlteacher 
\newtoks\cndate   %%日期
\newtoks\endate
\newtoks\cnkind  %%学科门类
\newtoks\enkind

\if@bachelor
\def\makecntitle{\null %
    \thispagestyle{empty}
    \begin{center}\vspace*{-3em}\bf\sanhao 
      \renewcommand{\arraystretch}{1.5}
      \begin{tabular}{p{\linewidth}}
       \multicolumn{1}{c}{\xiaoerhao\cntitlename}\\
       \tabularnewline \tabularnewline
       \begin{minipage}{\textwidth}\centering %
            \begin{spacing}{1.5}
           {\erhao\the\cntitle}
            \end{spacing}
       \end{minipage}\\
        \tabularnewline \tabularnewline \tabularnewline
        \multicolumn{1}{c}{%
          \if@pdftex
             \includegraphics[scale=1.0]{pic/cqu.jpg}
             \else
             \includegraphics[scale=1.0]{pic/cqu.eps}\fi}\\
        \tabularnewline \tabularnewline
        \multicolumn{1}{c}{%
          \begin{tabular}{l}
               学\qquad 生：\the\cnauthor  \\
               学\qquad 号：\the\xuehao  \\
               指导教师：\the\cnteacher  \\
           % 助理指导教师：\the\cnzlteacher  \\
               专\qquad 业：\the\cnmajor 
         \end{tabular}}
      \end{tabular} \vfill 
       {\xiaoerhao 重庆大学\the\cnxueyuan}\\[1em]
       {\the\cndate}
    \end{center}\newpage}
\def\makeentitle{\null %
    \thispagestyle{empty}
    \begin{center}\vspace*{-3em}\bf\sanhao 
      \renewcommand{\arraystretch}{1.5}
      \begin{tabular}{p{\linewidth}}
       \multicolumn{1}{c}{\entitlename}\\
       \tabularnewline \tabularnewline
       \begin{minipage}{\textwidth}\centering %
            \begin{spacing}{1.5}
           {\erhao\the\entitle}
            \end{spacing}
       \end{minipage}\\
        \tabularnewline \tabularnewline \tabularnewline
        \multicolumn{1}{c}{%
          \if@pdftex
             \includegraphics[scale=1.0]{pic/cqu.jpg}
             \else
             \includegraphics[scale=1.0]{pic/cqu.eps}\fi}\\
        \tabularnewline \tabularnewline
        \multicolumn{1}{c}{%
          \begin{tabular}{l}
           Undergraduate：\the\enauthor  \\
           Supervisor：\the\enteacher  \\
           % 助理指导教师：\the\enzlteacher  \\
           Major：\the\enmajor 
         \end{tabular}}
      \end{tabular} \vfill 
       {\xiaoerhao\the\enxueyuan}\\[1em]
       {\xiaoerhao Chongqing University}\\[1em]
       {\the\endate}
    \end{center}}
\else
\def\makecntitle{\null %
    \thispagestyle{empty}
    \begin{center}\vspace*{-3em}\bf\sanhao 
      \renewcommand{\arraystretch}{2}
      \begin{tabular}{p{\linewidth}}
       \begin{minipage}{\textwidth}\centering %
           \begin{spacing}{2}
           {\erhao\the\cntitle}
           \end{spacing}
       \end{minipage}\\
       \tabularnewline \tabularnewline
       \multicolumn{1}{c}{%
          \if@pdftex
             \includegraphics[scale=1.0]{pic/cqu.jpg}
             \else
             \includegraphics[scale=1.0]{pic/cqu.eps}\fi}\\
       \tabularnewline 
       \multicolumn{1}{c}{\xiaoerhao%
           \if@master 重庆大学硕士学位论文
                \else 重庆大学博士学位论文
           \fi}\\
        \tabularnewline       
        \multicolumn{1}{c}{%
          \begin{tabular}{l}
               学生姓名：\the\cnauthor  \\
               指导教师：\the\cnteacher  \\
           % 助理指导教师：\the\cnzlteacher  \\
               专\qquad 业：\the\cnmajor \\
               学科门类：\the\cnkind
         \end{tabular}}
      \end{tabular} \vfill 
       {\xiaoerhao 重庆大学\the\cnxueyuan}\\[1em]
       {\the\cndate}
    \end{center}\newpage}
\def\makeentitle{\null %
    \thispagestyle{empty}
    \begin{center}\vspace*{-3em}\bf\sanhao 
      \renewcommand{\arraystretch}{1.5}
      \begin{tabular}{p{\linewidth}}
        \begin{minipage}{\textwidth}\centering %
           \begin{spacing}{2}
           {\erhao\the\entitle}
           \end{spacing}
        \end{minipage}\\ 
        \tabularnewline
        \multicolumn{1}{c}{%
          \if@pdftex
             \includegraphics[scale=1.0]{pic/cqu.jpg}
             \else
             \includegraphics[scale=1.0]{pic/cqu.eps}\fi}\\
        \tabularnewline
        \multicolumn{1}{c}{\xiaoerhao A Thesis Submitted to %
              Chongqing University}\\
        \multicolumn{1}{c}{\xiaoerhao in Partial Fulfillment %
               of the Requirement for the}\\
        \multicolumn{1}{c}{\xiaoerhao Degree of 
            \if@master {Master} \else  {Doctor}\fi of \the\enkind 
         }\\
        \multicolumn{1}{c}{by}\\
        \multicolumn{1}{c}{\the\enauthor}\\
        \tabularnewline
        \multicolumn{1}{c}{%
          \begin{tabular}{c}
           Supervisor：\the\enteacher  \\
           % 助理指导教师：\the\enzlteacher  \\
           Major：\the\enmajor 
         \end{tabular}}
      \end{tabular} \vfill 
       {\xiaoerhao\the\enxueyuan}\\[1em]
       {\xiaoerhao Chongqing University,~Chongqing,~China.}\\[1em]
       {\the\endate}
    \end{center}}
\fi 

%%%%%%%%%%%%%%%%%%%%%%%%%定义摘要环境%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%cnabstract:中文摘要环境，cnkeywords：中文关键词
%%enabstract:英文摘要环境，enkeywords：英文关键词
%%注意：\cnkeywords和\enkeywords必须放在各环境前面
%%这两个环境页眉独立设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtoks\cnkeywords

\newtoks\enkeywords

\newenvironment{cnabstract}{\newpage %
     \if@bachelor
         \vspace*{-2\hangju}
         \else
         \vspace*{-\hangju}
     \fi
     \section*{摘\qquad 要\@mkboth{中文摘要}{}}}%
     {\par
     \if@bachelor
        \vskip 2\hangju \noindent
        \else
        \vskip \hangju \noindent
     \fi
      \hei{关键词：}\the\cnkeywords %
     \addcontentsline{toc}{section}{中文摘要} %
     }

\newenvironment{enabstract}{\newpage %
     \if@bachelor
         \vspace*{-2\hangju}
         \else
         \vspace*{-\hangju}
     \fi
     \section*{ABSTRACT}%
     \if@bachelor\@mkboth{ABSTRACT}{}
        \else\@mkboth{英文摘要}{}\fi}%
     {\par
     \if@bachelor
        \vskip 2\hangju \noindent
        \else
        \vskip \hangju \noindent
     \fi
     \textbf{Keywords:}~~\the\enkeywords %
     \addcontentsline{toc}{section}{ABSTRACT}%
     }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%致谢和附录设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%致谢环境：ack，单独一页
%%附录环境：cnappendix，apptitle定义附录名称，附录序号设置为大写字母，若有小节，
%%从subsection开始
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%定义致谢环境
\newcommand{\@ackname}{致\qquad 谢}
%\@mkboth{\refname}{\refname}%
\newenvironment{ack}{\newpage %
   \if@bachelor
         \vspace*{-2\hangju}
         \else
         \vspace*{-\hangju}
   \fi
   \section*{\@ackname\@mkboth{致谢}{}}}{%
   \addcontentsline{toc}{section}{致谢}
   \newpage}

%%%%%定义附录环境
\newcounter{appsection}
\renewcommand\theappsection{\Alph{appsection}}
\stepcounter{appsection}
\newcommand{\apptitle}[1]{%
    {\newpage 
     \@mkboth{\appendixname\theappsection :~#1}{}%
     \centering \vspace*{-0.2ex}
     \interlinepenalty \@M
     \normalfont \sanhao \bfseries %
     \appendixname\theappsection :~~#1\par}
     \addcontentsline{toc}{section}{\appendixname\theappsection :~#1}%
     \vspace*{\hangju}
     \stepcounter{appsection}\stepcounter{section}}
\newenvironment{cnappendix}{\par%
     \setcounter{section}{0}%
     \setcounter{subsection}{0}%   
     \def\thesection{\@Alph\c@section}}{}
%%简单的附录环境
\let\simappendix\appendix
\renewenvironment{simappendix}{%
     \if@bachelor
         \vspace*{-2\hangju}
         \else
         \vspace*{-\hangju}
     \fi
     \section*{附\qquad 录\@mkboth{\appendixname}{}%
     \appendix}}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%参考文献%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%重新定义参考文献环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{thebibliography}[1]{\newpage%
   \setlength{\baselineskip}{20bp}\wuhao
   \if@bachelor
         \vspace*{-2\hangju}
         \else
         \vspace*{-\hangju}
   \fi
   \section*{\refname}
   \addcontentsline{toc}{section}{参考文献}
   \@mkboth{\refname}{\refname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \settowidth\labelwidth{1em}
         \setlength{\labelsep}{0em}
         \setlength{\itemindent}{0pt}
         \setlength{\leftmargin}{\labelwidth+\labelsep}
         \addtolength{\itemsep}{-0.7em}
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\frenchspacing
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \interlinepenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist\frenchspacing}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%个人简历%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 定义个人简历
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newenvironment{resume}{%
%  \section*{\the\resumetitle}}{}
%作者在攻读学位期间发表的论文目录：
%作者在攻读学位期间取得的科研成果目录：
%%%%%%%%%%%%%%%%%%%%%%数学环境%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\numberwithin{equation}{section}   %%公式按节编号

%允许太长的公式断行、分页等。
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@section>\z@ %
     \thesection-\fi\@arabic\c@equation}
% 定理字样使用黑体，正文使用宋体，冒号隔开
\renewcommand{\proofname}{\bf 证明}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
    #1\@addpunct{:}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

\newtheorem{assumption}{假设}[section]
\newtheorem{definition}{定义}[section]
\newtheorem{proposition}{命题}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{theorem}{定理}[section]
\newtheorem{axiom}{公理}[section]
\newtheorem{corollary}{推论}[section]
\newtheorem{example}{例}[section]
\newtheorem{remark}{注释}[section]
\newtheorem{problem}{问题}[section]
\newtheorem{conjecture}{猜想}[section]
%%%%%%%%%%%%%%%%%%%%%%主要符号对照表%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%符号环境：denotation，有一个参数0和1,即，0表示不在目录中显示，1表示在目录中显示
%%还有一个参数控制label的宽度，单位cm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@denotation@name}{主要符号对照表}
\newenvironment{denotation}[2]{\newpage
   \ifnum1=#2
      \addcontentsline{toc}{section}{主要符号对照表}
   \fi
   \if@bachelor
       \vspace*{-2\hangju}
       \else
       \vspace*{-\hangju}
   \fi
   \@mkboth{\@denotation@name}{}%
  \section*{\@denotation@name}
  \noindent\begin{list}{}%
    {\vskip-30bp
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1cm} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}\newpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%其它命令%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 在导言区支持中文。
\def\@active@cjk{
  \count@=128
  \@whilenum\count@<254 \do{%
    \advance\count@ by 1
    \lccode`\~=\count@
    \catcode\count@=\active
    \lowercase{\def~{\kern1ex}}}}
\AtEndOfClass{\ifxetex\else\@active@cjk\fi}
% \pkg{caption} 宏包会调用 \pkg{ragged2e}，\pkg{ragged2e} 又调用 
%\pkg{everysel}。而 \pkg{everysel} 宏包和 \pkg{CJK}
% 宏包都要修改 \cs{selectfont}，一个是给 \cs{selectfont} 加 hook，一个是让
%  \cs{selectfont} 支持 \cs{CJKbold}。幸好两者本质上并不冲突，把他们源文件中对
%  \cs{selectfont} 重定义的部分合并一下就可以了。
\def\cqu@fixselectfont{%
  \ifx\@EverySelectfont@EveryHook\@undefined\else
    \DeclareRobustCommand{\selectfont}{%
       \ifx\f@linespread\baselinestretch \else
          \set@fontsize\baselinestretch\f@size\f@baselineskip \fi
       \xdef\font@name{%
          \csname\curr@fontshape/\f@size\endcsname}%
       \pickup@font
       \font@name
       % CJK addition:
       \CJK@bold@false
       \csname \curr@fontshape\endcsname
       % everysel addition:
       \@EverySelectfont@EveryHook
       \@EverySelectfont@AtNextHook
       \gdef\@EverySelectfont@AtNextHook{}%
       % end additions
       \size@update
       \enc@update}
  \fi}
% 把 CJK 环境放到合适的位置，以免导致其它宏包的命令位于 CJK 环境中而出现问题（比
% 如 natbib 的``Multiple-defined labels''，同时自动开启 CJK。 
\ifxetex
  \AtBeginDocument{}
\else
  \def\cqu@beginCJK{%
    \cqu@fixselectfont%
    \begin{CJK*}{UTF8}{song8}}
  \def\cqu@endCJK{\clearpage\end{CJK*}}
  \let\cqu@begindocumenthook\@begindocumenthook
  \let\cqu@enddocumenthook\@enddocumenthook
  \def\AtBeginDocument{\g@addto@macro\cqu@begindocumenthook}
  \def\AtEndDocument{\g@addto@macro\cqu@enddocumenthook}
  \def\@begindocumenthook{\cqu@begindocumenthook\cqu@beginCJK}
  \def\@enddocumenthook{\cqu@endCJK\cqu@enddocumenthook}
\fi
\AtEndOfClass{\sloppy}
%%%%%%中文破折号
\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{1.5em}{0.1ex}\kern0.3ex}
\newcommand{\shengluehao}{\,……\,}

% 设置一些 pdf 文档信息，依赖于 \pkg{hyperref} 宏包。
%\hypersetup{%
%    pdftitle={\the\cntitle},
%    pdfauthor={\the\cnauthor},
%    %linktocpage,%
%    bookmarks,CJKbookmarks,
%    bookmarksopen=true,
%    bookmarksnumbered=true,
%    breaklinks,
%    pdfborder=1}
