% All the informations are found on 
% https://www.overleaf.com/learn/How_to_write_a_LaTeX_class_file_and_design_your_own_CV_(Part_1)
% And part 2
%______________________________________________________________________________________________________________________

\LoadClass{article} %we take our structures from the article template
%______________________________________________________________________________________________________________________

\NeedsTeXFormat{LaTeX2e}  %It tells the compiler which version of LaTeX we are using
\ProvidesClass{my_cv}[2025-02-16 Marco Bissaro - Custom CV class]
%_______________________________-_______________________________________________________________________________________

\RequirePackage{titlesec} %we don't like all that much the sections of an article for our CV, we want something more contained
								%this package allows us to customize the format of each header and other things
\RequirePackage{graphicx} %this package allows us to insert images in our document, using its commands
\graphicspath{ {./images/} } %this tells the graphicx package that the images are in the directory of the document, inside a subfolder ``images''
\RequirePackage[dvipsnames]{xcolor}
\definecolor{Leaf}{HTML}{656d29}
\definecolor{Stem}{HTML}{a8a660}
\definecolor{Aloe}{HTML}{dadfbc}
\definecolor{Petal}{HTML}{e8f1f8}
\definecolor{MyDandelion}{HTML}{e88e01}
%______________________________________________________________________________________________________________________
%______________________________________________________________________________________________________________________
%LET'S PUT A FORMAT TO THE DOCUMENT'S SECTIONS
%Because we are using the article template, they will be 0: title? 1:chapter 2:section 3:subsection 4:subsubsection 5:paragraph 6:?

\titlespacing*{\section}{}{5mm}{5mm}
\titleformat{\section}         % Customise the \section command 
  {\color{Leaf}\Large\scshape\raggedright\textbf} % Make the \section headers large (\Large), small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [{\color{Stem}\titlerule}]                 % Inserts a horizontal line after the heading
  
% \bfseries, \itshape: make the heading bold or italic;
% \scshape:small capitals;
% \small, \normalsize, \large, \Large, \LARGE, \huge, \Huge: set the font size;
% \rmfamily, \sffamily, \ttfamily: set the font type to serifed, sans serifed or typewriter respectively.
  
\titleformat{\subsection}
  {\color{Leaf}\normalsize\scshape\raggedright}
  {}{0em}
  {}
 \titlespacing*{\paragraph}{}{1em}{1em}
 \titleformat{\paragraph}{\Huge\scshape\raggedright}{}{0em}{}
%______________________________________________________________________________________________________________________
  
  
  %This defines two new commands \datedsection and \datedsubsection which take two arguments: the section name as before, and a date which will be typeset on the right-hand side of the page. The \hfill command tells LaTeX to fill as much space as possible and so pushes the second argument (#2) to the right of the page. 
\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}
\newcommand{\spacefill}[2]{%
	#1\hfill#2%
}
\newcommand{\spacefilll}[3]{%
	#1\hfill#2\hfill#3%
}
\newcommand{\spacebig}[2]{%
	{\scshape #1\hfill#2}%
}
\newcommand{\boldnormal}[2]{
    \textbf{#1}#2
}

%We want to give the name a good look wherever we put it in the page!
\newcommand{\name}[2]{%
%	\centerline{\Huge{#1}}
	{\color{MyDandelion}\scshape\Huge\boldnormal{#1}{ #2}}
	}

\newcommand{\jobtitle}[1]{%
	{\large\color{MyDandelion}{#1}}
	}
% To recall the contact function, and insert objects into it, each object (#1, #2, etc.) has to be included in a {} after the \contact command
\newcommand{\info}[3]{%
	\centerline{%
		\makebox[0pt][c]{%
			#1 {\large\textperiodcentered} #2 {\large\textperiodcentered} #3 
		}%
	}% 
}
% EXAMPLE: \info{08-12-1995}{Pressana (VR)}{Italy}
		
\newcommand{\contact}[2]{%
	\centerline{%
		\makebox[0pt][c]{%
			#1 {\large\textperiodcentered} #2  
		}%
	}% 
}
% EXAMPLE		\contact{Tel. 		+393408000465}{marco3bissaro@gmail.com}

% Another version of the contact box, but it spaces elements as far apart as it can.
\newcommand{\longcontact}[5]{%
	\centerline{%
		\makebox[0pt][c]{%
			#1 \hfill #2 \hfill #3 \hfill #4 \hfill  #5%
		}%
	}%
}

%______________________________________________________________________________________________________________________


%this command allows you to create bulletpoints under the work subsections (or anywhere you want to put them?)
%again, to insert in place of #ed objects, you put them into {}
\newcommand{\workitems}[3]{%
		\begin{itemize}
		\item #1
		\item #2
		\item #3
		\end{itemize}%
}
\newcommand{\eduitems}[3]{%
		\begin{itemize}
		\item #1
		\item #2
		\item #3
		\end{itemize}%
}

\newcommand{\fullstar}{\includegraphics[height = 1em]{fullstar.png}}

\newcommand{\emptystar}{\includegraphics[height = 1em]{emptystar.png}}

\newcommand{\ftcinzel}[1]{{\fontfamily{cinzel} \MakeUppercase{#1}}}

% \RequirePackage{xparse}

% \newsavebox{\fminipagebox}
% \NewDocumentEnvironment{fminipage}{m O{\fboxsep}}
%  {\par\kern#2\noindent\begin{lrbox}{\fminipagebox}
%   \begin{minipage}{#1}\ignorespaces}
%  {\end{minipage}\end{lrbox}%
%   \makebox[#1]{%
%     \kern\dimexpr-\fboxsep-\fboxrule\relax
%     \fbox{\usebox{\fminipagebox}}%
%     \kern\dimexpr-\fboxsep-\fboxrule\relax
%   }\par\kern#2
%  }