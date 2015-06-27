%-*- coding: utf-8 -*-

% -------------------------------------------------
% jmaster.cls
% -------------------------------------------------
% 1999/02/18 Ver.1.00 : とりあえず完成
% 2007/12くらい : 九州大学のを元にして東北大学版を作成
% -------------------------------------------------
% 作成者: K.Honda
% modified: T.Okuyama
% -------------------------------------------------
% 使用方法
%
% jmaster.clsをTeXInputsに置いて、
% クラス指定を以下のようにして下さい。
%
%	\documentclass[12pt]{jmaster}
%
%
% -------------------------------------------------
\ProvidesClass{jmaster}[1999/02/18]	%% class name: jmaster
\LoadClassWithOptions{jreport}		%% jreportをベースにする。

% -------------------------------------------------
%  double space setting
% -------------------------------------------------
\def\baselinestretch{1.2}

% -------------------------------------------------
%  title page setting
% -------------------------------------------------
\def\department#1{\def\@department{#1}}
\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 3cm
  \begin{center}%
    {\LARGE 卒業論文 \par}%
    {\Huge \@title \par}%
    \vskip 5cm%
    {\Large 東北大学 工学部\\ 情報知能システム総合学科\\
  		\@department  4年\\
                篠原研究室 \\}%
    \vskip 1cm
    {\Large \@author \par}%
    \vskip 1cm
    {\Large \@date \par}%
  \end{center}\par
  \end{titlepage}%
  \setcounter{page}{0}
  \setcounter{footnote}{0}%
  \pagenumbering{roman}
  \let\thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@title\@empty
  \global\let\@department\@empty
  \global\let\@department\relax
  \global\let\maketitle\relax
}

% -------------------------------------------------
%  abstract page setting
% -------------------------------------------------
\def\abstract{\titlepage
  \setcounter{page}{0}
  \null\vfil
}
\def\endabstract{\par\vfil\null\endtitlepage}

% -------------------------------------------------
%  pagestyle setting
% -------------------------------------------------
\topmargin -0.35in
\textwidth 6.25in
\textheight 9.6in
\oddsidemargin 0.14in
\evensidemargin -0.22in
\pagestyle{myheadings}

% -------------------------------------------------
%  bibliography heading setting
% -------------------------------------------------
\def\thebibliography#1{%
  \chapter*{\refname\@mkboth{\refname}{\refname}}%
  \list{[\arabic{enumi}]}{%
    \settowidth\labelwidth{[#1]}%
    \leftmargin\labelwidth%
    \advance\leftmargin\labelsep%
    \usecounter{enumi}%
  }%
  \addcontentsline{toc}{chapter}{\refname}%
  \def\newblock{\hskip .11em plus .33em minus .07em}%
  \sloppy\clubpenalty4000\widowpenalty4000%
  \sfcode`\.=1000\relax%
}

% -------------------------------------------------
%  no numbers set on section/subsection/subsubsection
% -------------------------------------------------
\renewcommand{\thepart		}{\Roman{part}}
\renewcommand{\thechapter	}{\arabic{chapter}}
\renewcommand{\thesection	}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection	}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection	}{\thesubsection.\arabic{subsubsection}}
\renewcommand{\theparagraph	}{\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph	}{\theparagraph.\arabic{subparagraph}}

\renewcommand{\chapter}{%	章の開始ページのスタイル変更
  \clearpage%
  \thispagestyle{myheadings}%
  \global\@topnum\z@%
  \@afterindentfalse%
  \secdef\@chapter\@schapter%
}
\renewcommand{\@makechapterhead}[1]{%	見出しの変更(\chapter)
  \vspace*{30pt}{%
    \parindent 0pt \raggedright%
    \ifnum%
      \c@secnumdepth >\m@ne \LARGE\bf \@chapapp{\thechapter}章 \par%
      \vskip 20pt%
    \fi%
    \LARGE\bf #1\par%
    \nobreak \vskip 40pt%
  }%
}
\renewcommand{\@makeschapterhead}[1]{%	見出しの変更(\chapter*)
  \vspace*{20pt}{%
    \parindent 0pt \raggedright%
    \LARGE \bf #1\par%
    \nobreak \vskip 40pt%
  }%
}
\renewcommand{\section}{%	見出しの変更
  \@startsection{section}{1}{\z@}%
  {3.5ex plus 1ex minus .2ex}%	前の空き
  {2.3ex plus .2ex}%		後ろの空き
  {\large\bf}%			書式
}
\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {1.5ex plus .2ex}%
  {\normalsize\bf}%
}
\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {1.5ex plus .2ex}%
  {\normalsize\bf}%
}

% -------------------------------------------------
%  索引ページの指定
% -------------------------------------------------
\renewenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 35\p@
   \twocolumn[\@makeschapterhead{\indexname}]%
   \@mkboth{\indexname}{\indexname}%
%% \thispagestyle{jpl@in}\parindent\z@	%%	<- jreport.cls
   \thispagestyle{myheadings}\parindent\z@%	<- 変更
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}

% -------------------------------------------------
%  
% -------------------------------------------------
\def\abstractname{要 旨}
\def\tablename{表 }
\def\figurename{図 }
\def\indexname{索引}
\def\refname{参考文献} 
\def\listtablename{表一覧}
\def\listfigurename{図一覧}
\def\contentsname{目次}
%\def\@chapapp#1{第 \lower0.1ex\hbox{#1} 章}
%\def\@partapp#1{第 #1 部}


% -------------------------------------------------
%  
% -------------------------------------------------

\renewenvironment{itemize}%  
{%
   \begin{list}{\parbox{1zw}{$\bullet$}}% 見出し記号／直後の空白を調節
   {%
      \setlength{\topsep}{0zh}
      \setlength{\itemindent}{0zw}
      \setlength{\leftmargin}{5zw}%  左のインデント
      \setlength{\rightmargin}{0zw}% 右のインデント
      \setlength{\labelsep}{1zw}%    黒丸と説明文の間
      \setlength{\labelwidth}{3zw}%  ラベルの幅
      \setlength{\itemsep}{0em}%     項目ごとの改行幅
      \setlength{\parsep}{0em}%      段落での改行幅
      \setlength{\listparindent}{0zw}% 段落での一字下り
   }
}{%
   \end{list}%
}

\newcounter{enumCounter}
\renewenvironment{enumerate}%  
{%
   %\newcounter{enumCounter} % カウンタ
   \setcounter{enumCounter}{1}
   \begin{list}{\parbox{1zw}{\theenumCounter．\stepcounter{enumCounter}}}% 見出し記号／直後の空白を調節
   {%
      \setlength{\topsep}{0zh}
      \setlength{\itemindent}{0zw}
      \setlength{\leftmargin}{5zw}%  左のインデント
      \setlength{\rightmargin}{0zw}% 右のインデント
      \setlength{\labelsep}{1zw}%    黒丸と説明文の間
      \setlength{\labelwidth}{3zw}%  ラベルの幅
      \setlength{\itemsep}{0em}%     項目ごとの改行幅
      \setlength{\parsep}{0em}%      段落での改行幅
      \setlength{\listparindent}{0zw}% 段落での一字下り
   }
}{%
   \end{list}
}

% -------------------------------------------------
%  
% -------------------------------------------------

% 図のキャプションのスペース
\setlength{\abovecaptionskip}{-0.5cm} 
\setlength{\belowcaptionskip}{-0.3cm}

\makeatletter
\renewenvironment{figure}[1][htbp]{\@float{figure}[#1]}{\vspace{1.5cm}\end@float}
\renewenvironment{table}[1][htbp]{\@float{table}[#1]\vspace{0.5cm}}{\vspace{1cm}\end@float}
\makeatother

%数式のスペース
\setlength{\abovedisplayskip}{0pt} % 上部のマージン
\setlength{\belowdisplayskip}{0pt} % 下部のマージン

% ----------------------------------------------- end of jmaster.cls
