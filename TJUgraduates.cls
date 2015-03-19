 %==================================================
%% TJUgraduates.cls for TJU Master Thesis
%% based on CASthesis.cls -- http://www.ctex.org/PackageCASthesis
%% Hosted on https://github.com/weijianwen/tju-thesis-template-latex
%% TJU LaTeX Forum https://bbs.tju.edu.cn/bbsdoc,board,TeX_LaTeX.html
%% Encoding: UTF-8
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ }[2014/12/16 v0.6 Shanghai Jiao Tong University Template]
\def\version{v0.6}
\newif\iftju@bachelor\tju@bachelorfalse
\newif\iftju@master\tju@masterfalse
\newif\iftju@doctor\tju@doctorfalse
\DeclareOption{bachelor}{\tju@bachelortrue}
\DeclareOption{master}{\tju@mastertrue}
\DeclareOption{doctor}{\tju@doctortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[a4paper,fancyhdr,fntef,UTF8]{ctexbook}
\iftju@bachelor\relax\else
  \iftju@master\relax\else
    \iftju@doctor\relax\else
      \ClassError{TJUgraduates}%
      		{You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi

%% TJUgraduates.cls segments
% 0. Import TJUgraduates.cfg
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands. 
% 3. Configure the imported packages, also extend LaTeX command in TJUgraduates
% 4. Draw the TJUgraduates

%==========
% Segment 0. Import TJUgraduates.cfg 
%==========

%% 导入 TJUgraduates.cfg 文件
\AtEndOfClass{\input{TJUgraduates.cfg}}


%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage{ifthen}
\RequirePackage{lastpage}
\RequirePackage{fontspec}
\RequirePackage{metalogo}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm,mathrsfs} 
\RequirePackage{upgreek}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{ccaption}
\RequirePackage[super,square,sort&compress,numbers]{natbib}
\RequirePackage{xcolor}
\RequirePackage{marvosym}
\RequirePackage{wasysym}
\RequirePackage{listings}
\RequirePackage[xetex]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{setspace} 
%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========

% User defined command list
%% \me \mi \mj \dif \cleardoublepage \myRightarrow \myLeftarrow \myBigarrow \myLongEqual \cndash \CJKLaTeX \upcite

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

\newcommand\hangju[1]{\setlength{\baselineskip}{#1\baselineskip}}
\newcommand\hangjut[1]{\def\arraystretch{#1}}


% upper math letter
\newcommand{\me}{\mathrm{e}} 
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

% 可伸长的数学符号
\def\ExtendSymbol#1#2#3#4#5{\ext@arrow 0099{\arrowfill@#1#2#3}{#4}{#5}}
\def\RightExtendSymbol#1#2#3#4#5{\ext@arrow 0359{\arrowfill@#1#2#3}{#4}{#5}}
\def\LeftExtendSymbol#1#2#3#4#5{\ext@arrow 6095{\arrowfill@#1#2#3}{#4}{#5}}
\newcommand\myRightarrow[2][]{\RightExtendSymbol{=}{=}{\Rightarrow}{#1}{#2}}
\newcommand\myLeftarrow[2][]{\LeftExtendSymbol{\Leftarrow}{=}{=}{#1}{#2}}
\newcommand\myBioarrow[2][]{\ExtendSymbol{\Leftarrow}{=}{\Rightarrow}{#1}{#2}}
\newcommand\myLongEqual[2][]{\ExtendSymbol{=}{=}{=}{#1}{#2}}

\def\cleardoublepage{\clearpage%
	\if@openright%
	  \ifodd
	    \c@page%
	  \else%
  	    \thispagestyle{empty}%
  	    \hbox{}%
	    \newpage%
	  \fi%
	\fi}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX} 

% Upper quote
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in TJUgraduates
%==========

% Set the mainfont
\setmainfont{Times New Roman}
	 \newfontfamily{\arial}{Arial}


% Page Layout
\oddsidemargin 1 true cm
\textheight 24 true cm
\textwidth 14.5 true cm
\topmargin 12pt
\headheight 12pt
\parskip 0.5ex plus 0.25ex minus 0.25ex
\addtolength{\voffset}{-39.3pt} %% 上边距
\if@openright
  \evensidemargin 0 true cm
\else
  \evensidemargin 1 true cm
\fi
%% 行距缩放因子(x倍字号) 
\renewcommand{\baselinestretch}{1.3}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in ccaption pacakge
\captiondelim{\ }
\captionnamefont{\songti\zihao{5}}
\captiontitlefont{\songti\zihao{5}}

%中英文caption标注
\renewcommand{\bicaption}[4]{%
	\@if@contemptyarg{#1}{\caption{#2}}{\caption[#1]{#2}}
	\setlength{\abovecaptionskip}{1pt}
	\setlength{\belowcaptionskip}{6pt}
	\edef\@conttempc{#3}
	\expandafter \renewcommand \csname \@captype name\endcsname{\@conttempc}
	\@contmidbi
	\contcaption{#4}}
%中英文\bicaption modified to \fcaption for Figure
\newcommand{\fcaption}[2]{%
	\@ifnextchar[{\fcaption@i{#1}{#2}}{\fcaption@i{#1}{#2}[{#1}]}%
}\def\fcaption@i#1#2[#3]{\bicaption{#3}{#1}{Fig}{#2}}
%中英文\bicaption modified to \tcaption for Table
\newcommand{\tcaption}[2]{%
	\@ifnextchar[{\tcaption@i{#1}{#2}}{\tcaption@i{#1}{#2}[{#1}]}%
}\def\tcaption@i#1#2[#3]{\bicaption{#3}{#1}{Table}{#2}}





% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
   
\renewcommand{\p@subfigure}{\arabic{chapter}--\arabic{figure}} 
% Title
\renewcommand{\lstlistingname}{\tju@value@listingname} %% 重命名Listings标题头

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}


%  表格断行
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}


%% setting hyperref package
\hypersetup{
  bookmarksnumbered,%
  colorlinks,%
  linkcolor=blue,%
  citecolor=blue,%
  plainpages=false,%
  pdfstartview=FitH
}

%  参考文献风格 GBT7714-2005
\bibliographystyle{bst/GBT7714-2005NLang}

%==========
% Segment 4. Draw the TJUgraduates
%==========

\newcommand\tjuspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\tju@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\tjufiledate{#1}%
  \def\tjufileversion{#2}%
  \def\tjufileinfo{#3}}%
\expandafter\ifx\csname ver@TJUgraduates.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_TJUgraduates.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@TJUgraduates.cls\endcsname}
\fi
\expandafter\tju@getfileinfo\reserved@a\relax? ? \relax\relax
\def\tju@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\tjuunderline{\@ifnextchar[\tju@underline\CTEXunderline}

\newcommand\classification[1]{\def\tju@value@classification{#1}}
\newcommand\studentnumber[1]{\def\tju@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\tju@value@confidential{#1}}
\newcommand\UDC[1]{\def\tju@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\tju@value@serialnumber{#1}}
\newcommand\school[1]{\def\tju@value@school{#1}}
\newcommand\degree[1]{\def\tju@value@degree{#1}}
\renewcommand\title[2][\tju@value@title]{%
  \def\tju@value@title{#2}
  \def\tju@value@titlemark{\MakeUppercase{#1}}}
\newcommand\projectsource[1]{\def\tju@value@projectsource{#1}}
\renewcommand\author[1]{\def\tju@value@author{#1}}
\newcommand\advisor[1]{\def\tju@value@advisor{#1}}
\newcommand\viceadvisor[1]{\def\tju@value@viceadvisor{#1}}
\newcommand\advisorinstitute[1]{\def\tju@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\tju@value@major{#1}}
\newcommand\submitdate[1]{\def\tju@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\tju@value@defenddate{#1}}
\newcommand\institute[1]{\def\tju@value@institute{#1}}
\newcommand\chairman[1]{\def\tju@value@chairman{#1}}
\newcommand\faculty[1]{\def\tju@value@faculty{#1}}
\newcommand\discipline[1]{\def\tju@value@discipline{#1}}


% “绘制”TJU中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
%  logo +  学位
  \begin{center}     
	\begin{figure}
		\centering
		\includegraphics[width=10cm, height=2.6cm]{tju-logo}
	\end{figure}
	{\lishu \zihao{2}  \tju@label@statement}
	     
    \vskip \stretch{1}
    
       {\hangju{1.5} \bf\heiti\zihao{2} \tju@value@title}
       
    \vskip 20pt
    
    {\songti\zihao{-4} \tju@value@projectsource}
    
    \vskip \stretch{1}

    
    \def\tabcolsep{1pt}
%4号    
    {
    	\hangjut{1.1} \fangsong\zihao{3}
    \begin{tabular}{lll}
      \fangsong\tju@label@author &：~&\fangsong\tju@value@author
    \\
      \fangsong\tju@label@studentnumber &：&\fangsong\tju@value@studentnumber
    \\
      \fangsong\tju@label@faculty&：~&\fangsong \tju@value@faculty
    \\      
      \fangsong\tju@label@discipline&：~&\fangsong \tju@value@discipline
    \\   
      \fangsong\tju@label@major&：~&\fangsong \tju@value@major
    \\   
      \fangsong\tju@label@advisor&：~&\fangsong \tju@value@advisor
    \\  
      \fangsong\tju@label@viceadvisor&：~&\fangsong \tju@value@viceadvisor
    \end{tabular}
	}
     \vskip \stretch{1} 
      {\songti\zihao{3} \tju@value@defenddate}
  \end{center}
      \def\arraystretch{1.3}
  \clearpage
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
}


% English Title Page
\newcommand\englishtitle[1]{\def\tju@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\tju@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\tju@value@englishadvisor{#1}}
\newcommand\englishviceadvisor[1]{\def\tju@value@englishviceadvisor{#1}}
\newcommand\englishschool[1]{\def\tju@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\tju@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\tju@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\tju@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\tju@value@englishmajor{#1}}


\newcommand\englishfaculty[1]{\def\tju@value@englishfaculty{#1}}
\newcommand\englishdiscipline[1]{\def\tju@value@englishdiscipline{#1}}




% "绘制"英文标题页
\newcommand\makeenglishtitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  		\begin{figure}
  			\centering
  			\includegraphics[width=10cm, height=2.6cm]{tju-logo}
  		\end{figure}
  		
    {\normalfont\zihao{4} \tju@label@englishstatement}
    \vspace*{20pt}
    \vskip\stretch{1}
    


     {\arial\zihao{-2}
     	\textbf{\tju@value@englishtitle}}
     
     
    \vskip \stretch{1}
    
    
    {
    	\hangjut{1}    	\zihao{3}
    \begin{tabular}{l}

    	\tju@label@englishauthor：\tju@value@englishauthor	\\
    	\tju@label@englishstudentnumber ：\tju@value@studentnumber
    	\\
    	\tju@label@englishfaculty：\tju@value@englishfaculty\\      
    	\tju@label@englishdiscipline：\tju@value@englishdiscipline\\   
    	\tju@label@englishmajor： \tju@value@englishmajor\\   

\hspace{-6pt}\begin{tabular}{ll}
		\tju@label@englishadvisor ：&\tju@value@englishadvisor \\ 
  &\tju@value@englishviceadvisor \\  
\end{tabular} \\
  
		
%	    	\tju@label@englishadvisor&\\  
%													& \\
%    			}
    
    \end{tabular}
	}
    \vskip \stretch{1}       
      
      
      
    \vskip 30pt
      {\zihao{3} \tju@value@englishdate}
    \vskip 20pt
    \hangjut{1.3}
    
    
    
  \end{center}
  \clearpage
  \if@openright
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	\vskip 80pt
  	{\textbf{\zihao{-2} \tju@label@original}}
  \end{center}
  \vskip 10pt
  {
  	\zihao{4} 
  	\hangju{1.25}
  	\tju@label@originalcontent
  }
  \vskip 160pt
  {
  	\zihao{4}
  	\hspace{0.4\textwidth}	  \tju@label@authorsign\hspace{3em}
  	\vskip 15pt
  	\hspace{0.6\textwidth}	  \tju@label@originalDate
  }
  \clearpage
  \if@openright
  \thispagestyle{empty}
  \cleardoublepage
  \fi
}

% 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vskip 80pt
  {\textbf{\zihao{-2} \tju@label@authorization}}
  \end{center}
  \vskip 10pt
  {
  	\zihao{4} 
  	\hangju{1.25}
  	\tju@label@authorizationcontent
  }
	\vskip 160pt
   {
  	\zihao{4}
	\hspace{0.4\textwidth}	  \tju@label@authorsign\hspace{3em}
	    \vskip 15pt
	\hspace{0.6\textwidth}	  \tju@label@originalDate
	}
  \clearpage
  \if@openright
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}





% 根据学位论文类型、单双面打印设置页眉页脚类型
\pagestyle{fancy}
\fancyhf{}

\iftju@bachelor
  % 本科学位论文正文页眉页脚
  \fancyhead[LO, RE]{}
  \fancyhead[RO, LE]{\small { \tju@value@titlemark}}
  \fancyfoot[C]{\small{}第~{\bf\thepage}~页\,{}共~{\bf\pageref{LastPage}}~页}
  % 本科学位论文开章页页眉页脚，双面打印时只是交换左右页眉
  \fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
    \fancyhf{}%
    \fancyhead[L]{\small { \includegraphics[width=0.22\textwidth]{tjubanner}}}
    \fancyhead[R]{\small { \tju@value@titlemark}}
    \fancyfoot[C]{\small{}第~{\bf\thepage}~页\,{}共~{\bf\pageref{LastPage}}~页}
   }
\else
  % 研究生学位论文正文页眉页脚，针对openright和openany单独设置
  \if@openright
    \fancyhead[LE]{\small {\tju@value@school   ~     \tju@value@degree\tju@label@thesis}}
    \fancyhead[RO]{\small {\leftmark}}
    \fancyfoot[C]{\small {\thepage}}
    % 研究生学位论文开章页页眉页脚
    \fancypagestyle{plain} {
    	\fancyhf{}
    	\fancyhead[L]{
    		\small {\tju@value@school\tju@value@degree\tju@label@thesis}}
    	\fancyhead[R]{\small {\leftmark}}
    	% \fancyhead[L]{\small {\tju@value@titlemark}}
    	\fancyfoot[C]{\small {\thepage}}
    }
  \else
    \fancyhead[LO]{\small {\tju@value@school   ~     \tju@value@degree\tju@label@thesis}}
    \fancyhead[RE]{\small {\leftmark}}
    \fancyfoot[C]{\small {\thepage}}
    % 研究生学位论文开章页页眉页脚
    \fancypagestyle{plain} {
      \fancyhf{}
      \fancyhead[L]{
      	\small {\tju@value@school\tju@value@degree\tju@label@thesis}}
      \fancyhead[R]{\small {\leftmark}}
      % \fancyhead[L]{\small {\tju@value@titlemark}}
      \fancyfoot[C]{\small {\thepage}}
    }
  \fi
\fi


% 中英文摘要
\newenvironment{abstract}{\chapter*{\tju@label@abstract}\markboth{\tju@label@abstract}{}}{}
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bf\zihao{-4} \tju@label@keywords} #1}
\newenvironment{englishabstract}{\chapter*{\bfseries \tju@label@englishabstract}\markboth{\tju@label@englishabstract}{}}{}
\newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\bf\zihao{-4} \tju@label@englishkeywords} #1}

\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

% 参考文献环境


\renewenvironment{thebibliography}[1]
     {
     	\chapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      	\list{\@biblabel{\@arabic\c@enumiv}}
      %
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \normalsize\setlength{\baselineskip}{16pt}
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}
            }%
      \sloppy
	  \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
	      \endlist}

    
%\newenvironment{publications}[1]
%     {\chapter{\tju@label@publications}%
%      \@mkboth{\MakeUppercase\tju@label@publications}
%              {\MakeUppercase\tju@label@publications}%
%      {
%      	\list{\@biblabel{\@arabic\c@enumiv}}%
%           {\settowidth\labelwidth{\@biblabel{#1}}%
%            \leftmargin\labelwidth
%            \advance\leftmargin\labelsep
%            \@openbib@code
%            \usecounter{enumiv}%
%            \let\p@enumiv\@empty
%            \renewcommand\theenumiv{\@arabic\c@enumiv}}
%        }%
%      \sloppy
%      \clubpenalty4000
%      \@clubpenalty \clubpenalty
%      \widowpenalty4000%
%      \sfcode`\.\@m}
%     {\def\@noitemerr
%       {\@latex@warning{Empty `publications' environment}}%
%      \endlist}
    
    \newenvironment{publications}[1]
    {\chapter{\tju@label@publications}%
    	\@mkboth{\MakeUppercase\tju@label@publications}
    	{\MakeUppercase\tju@label@publications}%
    	{\textbf{已发表论文\LARGE}}
    	\list{\@biblabel{\@arabic\c@enumiv}}%
    	{\settowidth\labelwidth{\@biblabel{#1}}%
    		\leftmargin\labelwidth
    		\advance\leftmargin\labelsep
    		\@openbib@code
    		\usecounter{enumiv}%
    		\let\p@enumiv\@empty
    		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
    	\sloppy
    	\clubpenalty4000
    	\@clubpenalty \clubpenalty
    	\widowpenalty4000%
    	\sfcode`\.\@m}
    {\def\@noitemerr
    	{\@latex@warning{Empty `publications' environment}}%
    	\endlist}
    
    

\newenvironment{projects}[1]
     {\chapter{\tju@label@projects}%
      \@mkboth{\MakeUppercase\tju@label@projects}
              {\MakeUppercase\tju@label@projects}%
	      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}
    
    \newenvironment{resume}
  {\chapter{\tju@label@resume}}
  {}
  
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}
   
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}
   
\renewenvironment{thanks}
  {\chapter{\tju@label@thanks}}
  {}
  
\newenvironment{symbolnote}{\chapter{\tju@label@symbolnote}}{} 

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)

\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec

\endinput

%%
%% End of file `TJUgraduates.cls'.

