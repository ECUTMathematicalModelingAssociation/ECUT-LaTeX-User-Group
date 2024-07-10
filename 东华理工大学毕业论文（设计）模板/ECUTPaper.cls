%	ECUTPaper.cls
%	@author ECUT-TUG
% 	@date 2024/4/11
%	@version v0.0.1
%	This template follows thefancypagestyle MIT License

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                    定义的新的类
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\EP@name{ECUTPaper}
\def\EP@date{2024-5-25}
\def\EP@version{v0.0.1}
\def\EP@introduction{Provide ECUT graduation thesis template}
\ProvidesClass{\EP@name}[\EP@date~\EP@version~\EP@introduction]
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	---	载入Class
%
\LoadClass[a4paper]{article}
%页面基本设置
\RequirePackage[zihao=-4,UTF8,heading=true]{ctex}
\RequirePackage[AutoFakeBold=true,AutoFakeSlant=true]{xeCJK}

%标题设置
\ctexset{
	section={format={\heiti \zihao{-3} } \bfseries, beforeskip=12pt,afterskip=6pt}, 
	% 一级标题黑体，小三号，段前12磅，段后6磅
	subsection={format={\heiti \zihao{4}} \bfseries,beforeskip=6pt,afterskip=0pt},   
	% 二级标题黑体，四号，段前6磅，段后0磅
	subsubsection={format={\songti \zihao{-4}} \bfseries,beforeskip=0pt,afterskip=0pt}}	 
        %三级标题宋体，小四号，段前6磅，段后0磅
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                       定义页边距
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%执行标准:上边距2.8cm、下边距2.5cm、左边距2.5cm、右边距2.5cm、页眉1.6cm、页脚1.5cm、装订线为0.5cm。
\RequirePackage{geometry}
\geometry{a4paper,
        left=2.5cm,
        right=2cm,
        top=2.5cm,
        bottom=2cm,
        headsep=0.5cm,
        footskip=0.5cm,
        headheight=0.5cm,
        bindingoffset=5mm
}
%此处参数注明意义：
%%“页眉顶端距离”= top - headheight - headsep；
%%“页脚底端距离”= bottom - footskip。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                        定义字体
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{times}
\setmainfont{Times New Roman} %西文字体
\songti

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                    	定义页眉页脚
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 使用fancyhdr库
\RequirePackage{fancyhdr}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
% 默认页面页眉页脚样式

\fancypagestyle{thanks}{
    \fancyhf{}
    \fancyfoot[C]{\zihao{5} \thepage }% 页码位于页脚居中

    % 左右两栏页眉，左为论文题目右为当前章
    \fancyhead[L]{\songti\zihao{5}东华理工大学毕业\@theme}
    \fancyhead[R]{\songti\zihao{5}{致谢}}
}

\fancypagestyle{reference}{
    \fancyhf{}
    \fancyfoot[C]{\zihao{5} \thepage }% 页码位于页脚居中

    % 左右两栏页眉，左为论文题目右为当前章
    \fancyhead[L]{\songti\zihao{5}东华理工大学毕业\@theme}
    \fancyhead[R]{\songti\zihao{5}{参考文献}}
}
\fancypagestyle{append}{
    \fancyhf{}
    \fancyfoot[C]{\zihao{5} \thepage }% 页码位于页脚居中

    % 左右两栏页眉，左为论文题目右为当前章
    \fancyhead[L]{\songti\zihao{5}东华理工大学毕业\@theme}
    \fancyhead[R]{\songti\zihao{5}{附录}}
}
% 默认页面页眉页脚样式
\fancypagestyle{main}{
    \fancyhf{}
    \fancyfoot[C]{\zihao{5} \thepage }% 页码位于页脚居中

    % 左右两栏页眉，左为论文题目右为当前章
    \fancyhead[L]{\songti\zihao{5}东华理工大学毕业\@theme}
    \fancyhead[R]{\songti\zihao{5}{\leftmark}}

    % 居中式页眉，可以选择为论文题目或当前章
    %\fancyhead[C]{\zihao{-5}\leftmark}
    \renewcommand{\headrulewidth}{0.4pt}%页眉线宽
    \renewcommand{\footrulewidth}{0pt}%页脚线宽
}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                    定义标题和段落样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%定义1.5倍行距
\renewcommand{\baselinestretch}{1.5}
%设置各个标题样式
%不需要使用part和chapter层级

\newcommand{\sectionbreak}{\clearpage} %小节从新的一页开始

\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
	{0ex \@plus1ex \@minus.2ex}%
	{1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
	{0ex \@plus1ex \@minus .2ex}%
	{1em}%
	{\normalfont\normalsize\bfseries}}
\RequirePackage[indentafter]{titlesec}
%设置新的标题层级subsubsubsection
\titleclass{\subsubsubsection}{straight}[\subsubsection]
%设置编号
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
%设置标题样式
\titleformat{\subsubsubsection}{\raggedright \songti \bfseries \zihao{-4}}{\thesubsubsubsection}{1em}{}[]
\titlespacing*{\subsubsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
%设置目录样式
\RequirePackage{tocloft}
%重新设置目录等级，支持hyperref宏包
\RequirePackage{hyperref}
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@subparagraph{6}
%参考tocloft，定义\l@subsubsubsection
\newcommand{\l@subsubsubsection}[2]{%
	\ifnum \c@tocdepth > 3 \relax
	\vskip \cftbeforesubsubsubsecskip
	{\leftskip \cftsubsubsubsecindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftsubsubsubsecindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftsubsubsubsecnumwidth\relax
		\let\@cftbsnum \cftsubsubsubsecpresnum
		\let\@cftasnum \cftsubsubsubsecaftersnum
		\let\@cftasnumb \cftsubsubsubsecaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftsubsubsubsecfont #1}\nobreak
		\cftsubsubsubsecfillnum{#2}}%
	\fi}
\newlength{\cftbeforesubsubsubsecskip}
\setlength{\cftbeforesubsubsubsecskip}{\z@ \@plus.2\p@}
\newlength{\cftsubsubsubsecindent}
\newlength{\cftsubsubsubsecnumwidth}
\setlength{\cftsubsubsubsecindent}{7em}
\setlength{\cftsubsubsubsecnumwidth}{4em}
\newcommand{\cftsubsubsubsecfont}{\normalfont}
\newcommand{\cftsubsubsubsecpresnum}{}
\newcommand{\cftsubsubsubsecaftersnum}{}
\newcommand{\cftsubsubsubsecaftersnumb}{}
\newcommand{\cftsubsubsubsecleader}{\normalfont\cftdotfill{\cftsubsubsubsecdotsep}}
\newcommand{\cftsubsubsubsecdotsep}{\cftdotsep}
\newcommand{\cftsubsubsubsecpagefont}{\normalfont}
\newcommand{\cftsubsubsubsecafterpnum}{}
\newcommand{\cftsubsubsubsecfillnum}[1]{%
	{\cftsubsubsubsecleader}\nobreak
		\makebox[\@pnumwidth][\cftpnumalign]{\cftsubsubsubsecpagefont #1}\cftsubsubsubsecafterpnum\par
	}

%重写tocloft相关定义，解决tocloft中无法修改目录等级的问题
\renewcommand*{\l@paragraph}[2]{%
	\ifnum \c@tocdepth > 4 \relax
	\vskip \cftbeforeparaskip
	{\leftskip \cftparaindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftparaindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftparanumwidth\relax
		\let\@cftbsnum \cftparapresnum
		\let\@cftasnum \cftparaaftersnum
		\let\@cftasnumb \cftparaaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftparafont #1}\nobreak
		\cftparafillnum{#2}}%
	\fi}
\renewcommand*{\l@subparagraph}[2]{%
	\ifnum \c@tocdepth > 5 \relax
	\vskip \cftbeforesubparaskip
	{\leftskip \cftsubparaindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftsubparaindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftsubparanumwidth\relax
		\let\@cftbsnum \cftsubparapresnum
		\let\@cftasnum \cftsubparaaftersnum
		\let\@cftasnumb \cftsubparaaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftsubparafont #1}\nobreak
		\cftsubparafillnum{#2}}%
	\fi}
%重新设置缩进
\setlength{\cftparaindent}{11em}
\setlength{\cftparanumwidth}{5em}
\setlength{\cftsubparaindent}{13em}
\setlength{\cftsubparanumwidth}{6em}
%设置目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
%设置附录


%设置标题的引用
\def\sectionautorefname~#1\null{%
	第~#1~节\null
}
\def\subsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\paragraphautorefname~#1\null{%
	段落~#1~\null
}
\def\subparagraphautorefname~#1\null{%
	段落~#1~\null
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                     设置脚注格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%脚注每页重新计数
\@addtoreset{footnote}{page}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                      设置图表格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%设置图表标题的计数方式
\renewcommand{\thefigure}{\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@table}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}
%设置标题的样式
\RequirePackage{caption}
\DeclareCaptionFont{hust}{\normalsize \heiti}
\captionsetup{labelsep=quad}
\captionsetup{font={hust,singlespacing}}
\captionsetup[figure]{position=bottom,skip={0pt}}
\captionsetup[table]{position=top,skip={0pt}}
\setlength{\textfloatsep}{6pt}
\setlength{\floatsep}{0pt}
\setlength{\intextsep}{6pt}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

%重新设置图表autoref
%\newcommand{\figureautorefname}{图}
\def\figureautorefname~#1\null{%
	图~#1~\null
}
%\newcommand{\tableautorefname}{表}
\def\tableautorefname~#1\null{%
	表~#1~\null
}
%使用tabularx库并定义新的左右中格式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
%添加复杂的表格需求库
\RequirePackage{booktabs}
%设置三线表格式
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}
%添加图需要的库
\RequirePackage{graphicx}
%重新定义图和表的浮动环境，使其方便使用
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                     设置公式格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%使用ams的数学库
\RequirePackage{amsmath}
%设置公式间距为零
\AtBeginDocument{
	\setlength{\abovedisplayskip}{6pt}
	\setlength{\belowdisplayskip}{6pt}
	\setlength{\abovedisplayshortskip}{0pt}
	\setlength{\belowdisplayshortskip}{0pt}
}
%公式编号带章节
\numberwithin{equation}{section}
%重新设置公式autoref
%\newcommand{\equationautorefname}{等式}
\def\equationautorefname~#1\null{%
	式~(#1)~\null
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                 定义列表项的样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}
\setlist{noitemsep}

%用于解析参数
\RequirePackage{kvsetkeys}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                  添加几个新的文档属性
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def \@degree {}
\def \@major {}
\def \@school {}
\def \@stunum {}
\def \@instructor {}
\def \@englishtitle {}
\def \@englishname {}
\def \@jobtitle {}
\def \@theme{}
\def \@start{}
\newcommand{\school}[1]{\def \@school {#1}}
\newcommand{\stunum}[1]{\def \@stunum {#1}}
\newcommand{\instructor}[1]{\def \@instructor {#1}}
\newcommand{\englishtitle}[1]{\def \@englishtitle {#1}}
\newcommand{\englishname}[1]{\def \@englishname {#1}}
\newcommand{\major}[1]{\def \@major {#1}}
\newcommand{\degree}[1]{\def \@degree {#1}}
\newcommand{\jobtitle}[1]{\def \@jobtitle {#1}}
\newcommand{\theme}[1]{\def \@theme {#1}}
\newcommand{\start}[1]{\def \@start {#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\chinesezero}{\kern-0.2em\raisebox{-0.25ex}{\scalebox{1.4}{〇}}\kern-0.25em}
\newcommand{\chineseone}{一}
\newcommand{\chinesetwo}{二}
\newcommand{\chinesethree}{三}
\newcommand{\chinesefour}{四}
\newcommand{\chinesefive}{五}
\newcommand{\chinesesix}{六}
\newcommand{\chineseseven}{七}
\newcommand{\chineseeight}{八}
\newcommand{\chinesenine}{九}
\newcommand{\chineseten}{十}
\newcommand{\digittochinese}[1]{%
  \ifcase#1 \chinesezero \or \chineseone \or \chinesetwo \or \chinesethree \or \chinesefour \or \chinesefive \or \chinesesix \or \chineseseven \or \chineseeight \or \chinesenine \or \chineseten\fi
}
\newcommand{\yeartochinese}[1]{%
  \ifnum #1>9
    \yeartochinese{\the\numexpr #1/10 }%
  \fi
  \digittochinese{\the\numexpr #1 - 10*(#1/10)}%
}
\newcommand{\monthtochinese}[1]{%
  \ifnum #1<10
    \digittochinese{#1}%
  \else
     \chineseten \digittochinese{\the\numexpr(#1)-10}
  \fi
}
\newcommand{\daytochinese}[1]{%
  \ifnum #1<11
    \digittochinese{#1}%
  \else
    \ifnum #1<20
     \chineseten \digittochinese{\the\numexpr(#1)-10}
     \else
     \chinesetwo\chineseten \digittochinese{\the\numexpr(#1)-20}
    \fi
  \fi
}
\newcommand{\todayzh}{%
  \yeartochinese{\year}年\monthtochinese{\month}月\daytochinese{\day}日%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                定义新的标题页面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%固定长度下划线
\newcommand\dlmu[2][4cm]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
%可变长度下划线
\RequirePackage{longtitle}

%重置命令maketitle
\renewcommand{\maketitle}[1][12em]{
    \def\EP@titlecolor{Logo/ECUT_logo.pdf}
    \begin{titlepage}
        \begin{center}
            \includegraphics[height=2.89cm,width=11.54cm]{\EP@titlecolor}\\
            \vspace*{5em}
            {\zihao{-0}  \songti \@start   }\\
            \vspace{1.5em}
            {\zihao{3} \songti  \multilingualTitles
             {\bfseries \@title}
             {\bfseries \zihao{3} \@englishtitle}}

            \vspace{8em}
            {\zihao{3} \songti
                \renewcommand\arraystretch{1.3}
                    \begin{tabular}{cccc}
                    \bfseries 学生姓名：  &  \hspace{0.1cm}\dlmu[2cm]{\@author} & \bfseries 申请学位门类： & \dlmu[2.45cm]{\@degree} \\
                    \bfseries 学 \hfill 号：   & \multicolumn{3}{c}{\dlmu[9cm]{\@stunum}}          \\
                    \bfseries 专 \hfill 业：   & \multicolumn{3}{c}{\dlmu[9cm]{\@major}}             \\
                   \bfseries 学 \hfill 院：   & \multicolumn{3}{c}{\dlmu[9cm]{\@school}}            \\
                   \multicolumn{4}{l}{ {\bfseries 指导老师：} \dlmu[2.1cm]{\@instructor} \kern 0em {\bfseries 职称：} \kern 0em \dlmu[4.85cm]{\@jobtitle}}\\

                    \end{tabular}\\
            }
            \vspace{7em}
            {\zihao{3} \songti \textbf{\@date}}\\
        \end{center}
    \end{titlepage}
}
\RequirePackage{amssymb}

%设置命令\statement
\newcommand{\statement}{
	\clearpage
	\thispagestyle{empty}
	\begin{center}
	\kaishu \zihao{3} \bfseries	
    作 \space 者 \space 声 \space 明
	\end{center}
    \vspace{2em}
        {\kaishu \zihao{4}
	
    本人以信誉郑重声明：所呈交的学位毕业设计（论文），是本人在指导教师指导下由本人独立撰写完成的，没有剽窃、抄袭、造假等违反道德、学术规范和其他侵权行为。文中引用他人的文献、数据、图件、资料均已明确标注出，不包含他人成果及为获得东华理工大学或其他教育机构的学位或证书而使用过的材料。对本设计（论文）的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本毕业设计（论文）引起的法律结果完全由本人承担。

    本毕业设计（论文）成果归东华理工大学所有。

    特此声明。

    \vspace{4em}
    \rightline{毕业设计（论文）作者（签字）：\hspace{6em}}

    \rightline{签字日期：\hspace{4em} 年 \hspace{2em} 月 \hspace{2em} 日}

	\vspace{4em}
	本人声明：该学位论文是本人指导学生完成的研究成果，已经审阅过论文的全部内容，并能够保证题目、关键词、摘要部分中英文内容的一致性和准确性。	
    \vspace{4em}

	\rightline{学位论文指导教师签名：\hspace{6em}}

	\rightline{签字日期：\hspace{4em} 年 \hspace{2em} 月 \hspace{2em} 日}	
        }
    \clearpage
}

%设置命令\secondcover
\newcommand{\secondcover}{
	\clearpage
	\thispagestyle{empty}
\vspace*{\fill}
	\begin{center}
        {\zihao{2} \heiti \bfseries \@title}

        \vspace{2em}
        
        {\zihao{3} \songti \@author}

        \vspace{5em}

        \emph{\zihao{2} \@englishtitle}
        
        \vspace{2em}
        
        \emph{\zihao{3} \@englishname}
    \end{center}

\vspace*{\fill}
    \begin{center}
      {\vfill \zihao{3} \heiti \today}
    \end{center}
    \clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                定义新的中英文摘要环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%中文摘要环境
%执行标准：中文摘要“摘要”之间空两格，小二号黑体、居中，与摘要内容空一行，内容为小四号宋体。
%中文“关键词：”小四号黑体、摘要下方顶格，内容为小四号宋体，各关键词之间有一个分号及空格。
\newenvironment{cnabstract}[1]{
	\clearpage
	\thispagestyle{empty}
	\def \cnkeyword {#1}
	\clearpage
	\phantomsection
	\begin{center} \heiti  \zihao{-2} 摘 \qquad 要 \end{center}
    \songti \zihao{-4}
}
{
	\vspace{1em}
	\par\noindent {\heiti \zihao{-4} 关键词：} \songti \zihao{-4} \cnkeyword
	\clearpage
}
%英文摘要环境
\newenvironment{enabstract}[1]{
	\clearpage
	\thispagestyle{empty}
	\def \enkeyword {#1}
	\clearpage
	\phantomsection
	\begin{center} \bfseries  \zihao{-2} Abstract \end{center}
	\zihao{-4}
}{
	\vspace{1em}
	\par\noindent {\zihao{-4} \bfseries Key Words: } \zihao{-4} \enkeyword
	\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                  定义新的目录页面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%超链接设置
\hypersetup{
	%colorlinks = true,
	%linkcolor  = black,
	pdfborder = 000,%去掉链接红框
	pdfstartview=FitH%打开页面以窗口宽度显示
}
\renewcommand{\cfttoctitlefont}{\heiti\zihao{-2}\centerline}
\renewcommand{\contentsname}{\centerline{目\hspace{2em}录}}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforeloftitleskip}{0.5em}
\renewcommand{\cftafterloftitleskip}{0.5em}
\renewcommand{\cftsecdotsep}{\cftdotsep} %设置Section引导点
\renewcommand{\cftbeforesecskip}{0em} %设置段间距
\renewcommand{\cftsecfont}{\heiti } %设置Section字体
\renewcommand{\cftsecpagefont}{\heiti\bfseries} % 设置 Section 页码字体为加
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                     定义新的致谢环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{thankpage}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{致谢}
    \begin{center} \heiti  \zihao{-2} 致 \qquad 谢 \end{center}
    \vspace{2em} % 添加垂直空白
    \songti \zihao{-4}
    \setlength{\parindent}{2em} % 设置首行缩进
}{
    \clearpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                     设置参考文献
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{natbib}
\setcitestyle{numbers,square,comma}
\ctexset{bibname={\songti \centering\zihao{5}{参考文献}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                     设置附录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%