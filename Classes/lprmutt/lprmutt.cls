\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lprmutt}[2018/02/25 LP RMUTT]


\LoadClass[twoside]{book}

\def\subjecttitlethai#1{\def\@subjecttitlethai{#1}}
\def\subjecttitleenglish#1{\def\@subjecttitleenglish{#1}}
\def\subjectid#1{\def\@subjectid{#1}}
\def\subjectpoint#1{\def\@subjectpoint{#1}}
\def\author#1{\def\@author{#1}}
\def\date#1{\def\@date{#1}}
\def\prerequisite#1{\def\@prerequisite{#1}}

\newcommand{\printsubjectid}{\@subjectid}
\newcommand{\printsubjecttitlethai}{\@subjecttitlethai}
\newcommand{\printsubjecttitleenglish}{\@subjecttitleenglish}
\newcommand{\printsubjectpoint}{\@subjectpoint}
\newcommand{\printauthor}{\@author}
\newcommand{\printdate}{\@date}
\newcommand{\printprerequisite}{\@prerequisite}

\newcounter{unitclass}
\newcounter{starttopic}

\RequirePackage[a4paper,left=2.6cm,right=2.4cm,top=2.54cm,bottom=2.54cm]{geometry}
\RequirePackage[math,thaithm=false]{thaispec}

\RequirePackage{emptypage}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LE,RO]{\thepage}

\RequirePackage{multirow}
\RequirePackage{pgffor}
\RequirePackage{xifthen}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{longtable}

\RequirePackage{tabularx}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\RequirePackage{parskip}
\RequirePackage{titletoc}
\RequirePackage{tikz}

\RequirePackage{caption}
\captionsetup[table]{name=ตาราง}
\captionsetup[figure]{name=รูปภาพ}

\setlength{\parskip}{1ex}
\setlength{\parindent}{4ex}


\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

\newcounter{lecturecounter}
\newcounter{topiccounter}
\newcounter{subtopiccounter}
\newcounter{subsubtopiccounter}


\renewcommand{\theequation}{\theunitclass.\arabic{equation}}
\renewcommand{\thefigure}{\theunitclass.\arabic{figure}}
\renewcommand{\thetable}{\theunitclass.\arabic{table}}

\newcommand{\addtocline}[1]{\addtocounter{chapter}{1}\addcontentsline{toc}{chapter}{\arabic{chapter}.\hspace{2mm} #1}}



\newcommand{\lecturetitle}{}
\newcommand{\lecture}[4]{
\cleardoublepage
\newpage
\setcounter{unitclass}{#1}
\renewcommand{\lecturetitle}{#2}
\setcounter{starttopic}{#3}
\setcounter{topiccounter}{#3-1}
\setcounter{subtopiccounter}{0}
\setcounter{subsubtopiccounter}{0}
\ifthenelse{\equal{#3}{1}}{\setcounter{equation}{0}\setcounter{table}{0}\setcounter{figure}{0}}{}
\stepcounter{lecturecounter}

\addtocline{ใบเตรียมการสอนสัปดาห์ที่ \thelecturecounter}
\begin{table}[ht!]
\centering
\renewcommand{\arraystretch}{2}
\begin{tabularx}{\textwidth}{|Y|Y|}
\hline
\multirow{2}{*}{\textbf{แผนการสอนสัปดาห์ที่ \thelecturecounter}}
& \textbf{รหัสวิชา \@subjectid} \\ \cline{2-2}
& \textbf{บทเรียนที่ \foreach \x in {#3,...,#4} {\theunitclass.\x\ifthenelse{\x < #4}{,}{} } }  \\ \hline
\textbf{ชื่อหน่วย #2 }
& \textbf{เวลา \@subjectpoint\ ชั่วโมง }\\ \hline
\end{tabularx}
\end{table}
}


\newcommand{\topic}[1]{
\stepcounter{topiccounter}
\setcounter{subtopiccounter}{0}
\setcounter{subsubtopiccounter}{0}
\setlength{\parindent}{4ex}
\vspace{3\parskip}
\par
\textbf{\large\theunitclass.\thetopiccounter\hspace{4ex} #1}\par\vspace{3\parskip}
}


\newcommand{\subtopic}[1]{
\setcounter{subsubtopiccounter}{0}
\setlength{\parindent}{8ex}
\vspace{3\parskip}
\par
\stepcounter{subtopiccounter}
\textbf{\large\theunitclass.\thetopiccounter.\thesubtopiccounter\hspace{4ex} #1}\par\vspace{3\parskip}}

\newcommand{\subsubtopic}[1]{
\setlength{\parindent}{12ex}
\vspace{3\parskip}
\par
\stepcounter{subsubtopiccounter}
\textbf{\theunitclass.\thetopiccounter.\thesubtopiccounter.\thesubsubtopiccounter\hspace{4ex} #1}\par\vspace{3\parskip}}

\renewcommand{\contentsname}{\vspace{-27mm}\hfill\large\textbf{สารบัญ}\hfill}


\newenvironment{content}
{
\cleardoublepage\newpage\hfill\large\textbf{เนื้อหา}\hfill\hspace{0.1mm}\par\vspace{5mm}\setlength{\parindent}{4ex}\normalsize}
{

}

\newenvironment{preview}
{\noindent\textbf{เนื้อหา}\par\noindent\textbf{หน่วยที่ \theunitclass\ \lecturetitle}\par\normalsize
\begin{enumerate}[label=\theunitclass.\arabic*,leftmargin=4\parindent]
\setcounter{enumi}{\thestarttopic-1}
}
{\end{enumerate}}

\newenvironment{objective}
{\noindent\textbf{จุดประสงค์การสอน}\par\normalsize
\begin{enumerate}[label=\theunitclass.\arabic*,leftmargin=*,align=left]
\setcounter{enumi}{\thestarttopic-1}
}
{\end{enumerate}}

\newenvironment{subobjective}{\begin{enumerate}[label*=.\arabic*,leftmargin=2\parindent]}{\end{enumerate}}

\newcounter{theoremcounter}
\newenvironment{theorem}[1][]{\stepcounter{theoremcounter}\vspace{2\parskip}\par\noindent\textbf{ทฤษฎีบท \theunitclass.\thetopiccounter.\thetheoremcounter\hspace{2ex}}\ifthenelse{\equal{#1}{}}{}{(#1)}\itshape}{\par\vspace{2\parskip}}
\newenvironment{definition}[1][]{\stepcounter{theoremcounter} \vspace{2\parskip}\par\noindent\textbf{นิยาม \theunitclass.\thetopiccounter.\thetheoremcounter\hspace{2ex}}\ifthenelse{\equal{#1}{}}{}{(#1)}}{\par\vspace{2\parskip}}
\newenvironment{lemma}[1][]{\stepcounter{theoremcounter}\vspace{2\parskip}\par\noindent\textbf{[บทตั้ง \theunitclass.\thetopiccounter.\thetheoremcounter\hspace{2ex}}\ifthenelse{\equal{#1}{}}{}{(#1)}\itshape}{\par\vspace{2\parskip}}
\newenvironment{corollary}[1][]{\stepcounter{theoremcounter}\vspace{2\parskip}\par\noindent\textbf{[บทแทรก \theunitclass.\thetopiccounter.\thetheoremcounter\hspace{2ex}}\ifthenelse{\equal{#1}{}}{}{(#1)}\itshape}{\par\vspace{2\parskip}}
\newenvironment{example}[1][]{\stepcounter{theoremcounter} \vspace{2\parskip}\par\noindent\textbf{ตัวอย่าง \theunitclass.\thetopiccounter.\thetheoremcounter\hspace{2ex}}\ifthenelse{\equal{#1}{}}{}{(#1)}}{\par\vspace{2\parskip}}


\renewenvironment{proof}{\vspace{-2\parskip}\par\noindent\textbf{พิสูจน์}\hspace{4ex}}{\par\hfill\rule{0.6em}{0.6em}\par\vspace{2\parskip}}



\newenvironment{exercise}{\newpage\hfill\large\textbf{แบบฝึกหัดท้ายบท}\hfill\vspace{3\parskip}\par\normalsize\begin{enumerate}
	}{\end{enumerate}}

\newenvironment{remtable}{\newpage\vspace{\parskip}\par\normalsize\begin{table}[ht!]
\centering\renewcommand{\arraystretch}{2}
\begin{tabular}{|l|l|p{5cm}|}}{\end{tabular}
\end{table}}

\newenvironment{preface}{
\cleardoublepage
\newpage
\addtocontents{toc}{~\hfill\textbf{หน้า}\par}
\addtocline{คำนำ}
\hfill\large\textbf{คำนำ}\hfill\vspace{3\parskip}\par\normalsize}{}

\newenvironment{subjectdescription}
{
\cleardoublepage
\addtocline{ลักษณะรายวิชา}
{\centering\large\textbf{ลักษณะรายวิชา}\vspace{3\parskip}\par}
\newcounter{sdcounter}
\normalsize
\renewcommand{\arraystretch}{1.5}
\begin{tabular}{p{4cm}p{10cm}}
}
{\end{tabular}\par}

\newcommand{\itemsd}[2]{
\stepcounter{sdcounter}
\textbf{\thesdcounter. #1} & #2 \\}

\newenvironment{organization}
{
\cleardoublepage
\addtocline{การแบ่งหน่วยการสอน}
{\centering\large\textbf{การแบ่งหน่วยการสอน}\vspace{3\parskip}\par}
}
{\par}

\newenvironment{lectureorg}
{\begin{enumerate}[label=หน่วยที่ \arabic*\;,leftmargin=6cm]}
{\end{enumerate}\vspace{3\parskip}\par}

\newcommand{\localvspace}{\par\vspace{8mm}}

\newcommand{\printtextuni}
{
\cleardoublepage
\addtocline{ปรัชญา ปณิธาน วิสัยทัศน์ พันธกิจ อัตลักษณ์ และเอกลักษณ์  ของมหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี}
{\centering\Large\textbf{ปรัชญา ปณิธาน วิสัยทัศน์ พันธกิจ อัตลักษณ์ และเอกลักษณ์ \\ ของมหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี}\vspace{3\parskip}\par}

\noindent\large\textbf{ปรัชญา (Philosophy)}\par\normalsize
มหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี มุ่งเน้นการพัฒนากำลังคนด้านวิทยาศาสตร์และเทคโนโลยี ให้มีทักษะความชำนาญด้านวิชาชีพ เสริมสร้างทุนมนุษย์ที่มีมูลค่าเพิ่มให้กับประเทศไทยและภูมิภาค\localvspace

\noindent\large\textbf{ปณิธาน (Determination)}\par\normalsize
มุ่งมั่นจัดการศึกษาวิชาชีพด้านวิทยาศาสตร์และเทคโนโลยีที่มีคุณภาพด้วยการพัฒนาอย่างต่อเนื่อง\localvspace

\noindent\large\textbf{วิสัยทัศน์ (Vision)}\par\normalsize
มหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรีเป็นมหาวิทยาลัยนักปฏิบัติมืออาชีพชั้นนำด้านวิทยาศาสตร์เทคโนโลยีนวัตกรรมในระดับประเทศและก้าวสู่ระดับสากล\localvspace

\noindent\large\textbf{พันธกิจ (Mission)}\par\normalsize
\begin{enumerate}[leftmargin=12mm]
	\item จัดการศึกษาวิชาชีพระดับอุดมศึกษาบนพื้นฐานวิทยาศาสตร์เทคโนโลยีและนวัตกรรมอย่างมีคุณภาพ
	\item สร้างงานวิจัย สิ่งประดิษฐ์นวัตกรรม และงานสร้างสรรค์ สู่การผลิตเชิงพาณิชย์และการถ่ายทอดเทคโนโลยี เพื่อเพิ่มขีดความสามารถในการแข่งขันของประเทศ
	\item ให้บริการวิชาการที่มีแนวคิดเชิงสร้างสรรค์ เพื่อการมีอาชีพอิสระและพัฒนาอาชีพ สู่การเพิ่มศักยภาพในการแข่งขัน
	\item ทำนุบำรุงศาสนา ศิลปะและวัฒนธรรม  และอนุรักษ์สิ่งแวดล้อม
	\item จัดระบบบุคลากรจากสังคมแห่งการเปลี่ยนแปลงให้สนองต่อสิทธิประโยชน์บนพื้นฐานความสุขและความก้าวหน้า
	\item จัดระบบบริหารจัดการเพื่อเพิ่มประสิทธิภาพและเพิ่มแนวทางการจัดหารายได้ เพื่อเอื้อต่อนโยบายหลัก
\end{enumerate}
\localvspace

\noindent\large\textbf{อัตลักษณ์ (Identity)}\par\normalsize
บัณฑิตนักปฏิบัติมืออาชีพ\localvspace

\noindent\large\textbf{เอกลักษณ์ (Uniqueness)}\par\normalsize
มหาวิทยาลัยนักปฏิบัติมืออาชีพด้านวิทยาศาสตร์เทคโนโลยีและนวัตกรรม\localvspace
}

\newcommand{\printtextfac}
{
\cleardoublepage
\addtocline{ปรัชญา ปณิธาน วิสัยทัศน์ พันธกิจ อัตลักษณ์ และเอกลักษณ์  ของคณะวิทยาศาสตร์และเทคโนโลยี}
{\centering\Large\textbf{ปรัชญา ปณิธาน วิสัยทัศน์ พันธกิจ อัตลักษณ์ และเอกลักษณ์ \\ ของคณะวิทยาศาสตร์และเทคโนโลยี}\vspace{3\parskip}\par}

\noindent\large\textbf{ปรัชญา (Philosophy)}\par\normalsize
คณะวิทยาศาสตร์และเทคโนโลยี มุ่งเน้นการพัฒนากำลังคนด้านวิทยาศาสตร์และเทคโนโลยีให้มีทักษะและความชำนาญด้านวิชาชีพ  เสริมสร้างทุนมนุษย์ที่มีมูลค่าเพิ่มให้กับประเทศไทยและภูมิภาค
\localvspace

\noindent\large\textbf{ปณิธาน (Determination)}\par\normalsize
มุ่งมั่นจัดการศึกษาวิชาชีพด้านวิทยาศาสตร์และเทคโนโลยีที่มีคุณภาพด้วยการพัฒนาอย่างต่อเนื่อง\localvspace

\noindent\large\textbf{วิสัยทัศน์ (Vision)}\par\normalsize
คณะวิทยาศาสตร์และเทคโนโลยี เป็นคณะที่ผลิตบัณฑิตนักปฏิบัติมืออาชีพชั้นนำ
ด้านวิทยาศาสตร์เทคโนโลยี และนวัตกรรมในระดับประเทศและก้าวสู่ระดับสากล
\localvspace

\noindent\large\textbf{พันธกิจ (Mission)}\par\normalsize
\begin{enumerate}[leftmargin=12mm]
	\item จัดการศึกษาวิชาชีพระดับอุดมศึกษาบนพื้นฐานวิทยาศาสตร์ เทคโนโลยี และนวัตกรรมอย่างมีคุณภาพ
	\item สร้างงานวิจัย สิ่งประดิษฐ์ และนวัตกรรม สู่การผลิตเชิงพาณิชย์และการถ่ายทอดเทคโนโลยี เพื่อเพิ่มขีดความสามารถในการแข่งขันของประเทศ
	\item ให้บริการวิชาการที่มีแนวคิดเชิงสร้างสรรค์ เพื่อการมีอาชีพอิสระและพัฒนาอาชีพสู่การเพิ่มศักยภาพในการแข่งขัน
	\item ทำนุบำรุงศาสนา ศิลปะและวัฒนธรรม  และอนุรักษ์สิ่งแวดล้อม
	\item จัดระบบบุคลากรจากสังคมแห่งการเปลี่ยนแปลงให้สนองต่อสิทธิประโยชน์บนพื้นฐานความสุขและความก้าวหน้า จัดระบบบริหารจัดการเพื่อเพิ่มประสิทธิภาพ และเพิ่มแนวทางการจัดหารายได้ เพื่อเอื้อต่อนโยบายหลัก
\end{enumerate}
\localvspace

\noindent\large\textbf{อัตลักษณ์ (Identity)}\par\normalsize
บัณฑิตนักปฏิบัติมืออาชีพ\localvspace

\noindent\large\textbf{เอกลักษณ์ (Uniqueness)}\par\normalsize
คณะวิทยาศาสตร์และเทคโนโลยีนักปฏิบัติมืออาชีพด้านวิทยาศาสตร์เทคโนโลยีและนวัตกรรม\localvspace
}

\newcommand{\printtextobj}
{
\cleardoublepage
\addtocline{วัตถุประสงค์ของหลักสูตร}
{\centering\Large\textbf{วัตถุประสงค์ของหลักสูตร}\vspace{3\parskip}\par\large\textbf{หลักสูตรระดับ ปริญญาตรี}\vspace{3\parskip}
\par}
\normalsize
\begin{enumerate}
	\item เพื่อให้ความรู้พื้นฐานอันจำเป็น (essential knowledge) แก่นักศึกษาทุกคน สำหรับการเป็นพลเมืองดี
	\item เพื่อเพิ่มพูนความเจริญงอกงามทางสติปัญญา (Intellectual skill) อันจะช่วยให้นักศึกษาสามารถนำความรู้ไปใช้ในการแก้ปัญหาชีวิต และช่วยจรรโลงสังคมให้เจริญรุ่งเรือง
	\item เพื่อช่วยพัฒนาลักษณะและอุปนิสัย ทัศนคติ และอุดมคติให้สมกับเป็นบัณฑิต
	\item เพื่อเป็นส่วนประกอบในความพร้อมของการศึกษาทุกแขนงวิชาชีพ และเตรียมการให้นักศึกษาได้มีโอกาสเรียนวิชาวิทยาศาสตร์จนถึงระดับเชี่ยวชาญเฉพาะทาง (specialization)
\end{enumerate}

}

\newenvironment{orgtable}
{
{\centering\large{การแบ่งหน่วยการสอน}\vspace{3\parskip}\par}
\normalsize
\renewcommand{\arraystretch}{2}
\begin{longtable}{|c|p{11cm}|c|}
\hline
\textbf{หน่วยเรียนที่} & \multicolumn{1}{c|}{\textbf{ชื่อหน่วยการสอน/บทเรียน/หัวข้อ}} & \textbf{ชั่วโมงเรียน} \\ \hline
\endhead
}
{\end{longtable}}

\newcounter{orglecturecounter}
\setcounter{orglecturecounter}{0}

\newcommand{\orglecture}[3]
{
\stepcounter{orglecturecounter}
\theorglecturecounter
&
\textbf{หน่วยที่ \theorglecturecounter\ #1 }
\vspace{6pt}
\setlist[enumerate]{itemsep=4pt}
\begin{enumerate}[label=\theorglecturecounter.\arabic*]
#3
\end{enumerate}
&
#2 ชั่วโมง
\\ \hline
}

\newcommand{\orgremaek}{
\renewcommand{\arraystretch}{1.4}
\begin{table}[ht!]
\begin{tabular}{p{2cm}p{4cm}ll}
\textbf{หมายเหตุ} & สัปดาห์เรียนรวมทั้งหมด  & 15 & สัปดาห์ \\
                  & สัปดาห์สอบกลางภาค  & 1  & สัปดาห์ \\
                  & สัปดาห์สอบปลายภาค  & 1  & สัปดาห์ \\
                  & รวมทั้งสิ้น  & 17 & สัปดาห์
\end{tabular}
\end{table}
}

\newcounter{intelec}
\setcounter{intelec}{0}
\newcommand{\intelec}[3]{
\stepcounter{intelec}
\theintelec
&
\textbf{หน่วยที่ \theintelec\ #1 }
\vspace{6pt}
\setlist[enumerate]{itemsep=4pt}
\begin{enumerate}[label=\theintelec.\arabic*]
#3
\end{enumerate}
&
#2 ชั่วโมง
\\ \hline
}

\newenvironment{intention}
{
\cleardoublepage
\addtocline{จุดประสงค์การสอน}
{\centering\large\textbf{จุดประสงค์การสอน}\vspace{3\parskip}\par}
\normalsize
\renewcommand{\arraystretch}{2}
\begin{longtable}{|c|p{11cm}|c|}
\hline
\textbf{หน่วยเรียนที่} & \multicolumn{1}{c|}{\textbf{ชื่อหน่วยการสอน/บทเรียน/หัวข้อ}} & \textbf{ชั่วโมงเรียน} \\ \hline
\endhead
}
{\end{longtable}\par}

\newenvironment{edudev}
{
\cleardoublepage
\addtocline{การพัฒนาผลการเรียนรู้ของนักศึกษา}
{\centering\large\textbf{การพัฒนาผลการเรียนรู้ของนักศึกษา}\vspace{3\parskip}\par}
\normalsize
\begin{enumerate}[label=\arabic*.,leftmargin=0cm,align=left]
}
{\end{enumerate}\par}

\newcommand{\withbc}{\tikz[overlay]{\draw[fill=black,line width=1pt]  (-1.8,0.15)  circle(1ex);}}
\newcommand{\withwc}{\tikz[overlay]{\draw[fill=white,line width=1pt] (-1.8,0.15)  circle(1ex);}}

\newenvironment{enumdev}{\begin{enumerate}[label*=\arabic*]}{\end{enumerate}}
\newenvironment{subenumdev}{\begin{enumerate}[label*=.\arabic*,leftmargin=16\parskip]}{\end{enumerate}}

\newenvironment{assessment}
{\cleardoublepage
\addtocline{การประเมินผลรายวิชา}
{\centering\large\textbf{การประเมินผลรายวิชา}\vspace{3\parskip}\par\noindent}
\normalsize
}
{\par}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\newcounter{unitscore}
\setcounter{unitscore}{0}
\newcommand{\unitscore}[5]{
\stepcounter{unitscore}
\theunitscore &
หน่วยที่ \theunitscore\ #1 &
#2 & #3 & #4 & #5 \\ \hline
}

\newcommand{\unitcatscore}[6]{
#1 &
#2 &
#3 & #4 & #5 & #6 \\ \hline
}

\newenvironment{scoretable}
{\cleardoublepage
\addtocline{ตารางกำหนดน้ำหนักคะแนน}
{\centering\large\textbf{ตารางกำหนดน้ำหนักคะแนน}\vspace{3\parskip}\par\noindent}
\normalsize
\renewcommand{\arraystretch}{1.4}
\begin{table}[ht!]
\centering
\begin{tabular}{|c|L{8.5cm}|C{0.8cm}|C{0.8cm}|C{0.8cm}|C{0.8cm}|}
\hline
\multirow{3}{*}{หน่วยการเรียน} & \multirow{3}{*}{ชื่อหน่วย} & \multirow{3}{*}{\rotatebox[origin=c]{90}{คะแนนรายหน่วย\hspace{22pt}}} & \multicolumn{3}{c|}{น้ำหนักคะแนน} \\ \cline{4-6}
 &  &  & \multicolumn{3}{c|}{พุทธพิสัย} \\ \cline{4-6}
 &  &  & {\rotatebox[origin=c]{90}{\hspace{8pt}ความรู้-ความจำ\hspace{8pt}}} & {\rotatebox[origin=c]{90}{ความเข้าใจ}} & {\rotatebox[origin=c]{90}{การนำไปใช้}} \\ \hline

}
{
&\textbf{รวมทั้งสิ้น} & \textbf{100} &  &  &  \\ \hline
\end{tabular}
\end{table}
\par\noindent\textbf{หมายเหตุ}
\begin{enumerate}
	\item นักศึกษาต้องเข้าเรียนไม่น้อยกว่าร้อยละ 80 ของเวลาเรียนทั้งหมด หากเวลาเรียนไม่ครบ ถือว่าไม่ผ่านรายวิชา
	\item นักศึกษาต้องเข้าสอบครบทั้งกลางภาคและปลายภาค
	\item คะแนนคุณธรรม จริยธรรม พิจารณาจากการเช็คชื่อ การส่งงาน (จิตพิสัย)
	\item คะแนนความรู้ภาควิชาการและทักษะทางปัญญา ประเมินจากการสอบกลางภาคและปลายภาค
	\item คะแนนทักษะความสัมพันธ์ระหว่างบุคคลและความรับผิดชอบ ประเมินจากการเข้าร่วมกิจกรรมและการสังเกตพฤติกรรม
	\item คะแนนการวิเคราะห์เชิงตัวเลข การสื่อสาร และการใช้เทคโนโลยีสารสนเทศ ประเมินจากงานที่มอบหมาย
\end{enumerate}
}

\newenvironment{weeklyplan}
{\cleardoublepage
\addtocline{กำหนดการสอนรายสัปดาห์}
{\centering\large\textbf{กำหนดการสอนรายสัปดาห์}\vspace{3\parskip}\par\noindent}
\normalsize
\renewcommand{\arraystretch}{2}
\begin{longtable}{|c|p{11cm}|c|}
\hline
\textbf{สัปดาห์ที่} & \multicolumn{1}{c|}{\textbf{หน่วยการเรียน / รายละเอียด}} & \textbf{จำนวนชั่วโมง} \\ \hline
\endhead
}
{\end{longtable}}

\newcounter{wlec}
\setcounter{wlec}{0}

\newcommand{\weeklylecture}[4]
{
\stepcounter{wlec}
\thewlec
&
\textbf{หน่วยที่ #1 #2}
\vspace{6pt}
\setlist[enumerate]{itemsep=4pt}
#4
&
#3 ชั่วโมง
\\ \hline
}


\renewenvironment{bibliography}
{\cleardoublepage
\addtocline{บรรณานุกรม}
{\centering\large\textbf{บรรณานุกรม}\vspace{3\parskip}\par\noindent}
\normalsize\noindent
\begin{enumerate}[label=\arabic*.\;]
}
{\end{enumerate}}


\newcommand{\showcover}{
\cleardoublepage
\thispagestyle{empty}
\begin{center}
\includegraphics[height=5.8cm]{rmuttlogo}
\par\vspace{1cm}
\huge{เอกสารประกอบการสอน}
\par
\huge{รายวิชา \printsubjecttitlethai\ (\printsubjecttitleenglish)}
\par
\huge{(\printsubjectid)}
\par\vspace{3cm}
\huge{โดย}
\par
\huge{\printauthor}
\par\vspace{3cm}
\huge{ภาควิชาคณิตศาสตร์และวิทยาการคอมพิวเตอร์}
\par
\huge{คณะวิทยาศาสตร์และเทคโนโลยี}
\par
\huge{มหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี}
\par
\huge{\theyearbd}
\end{center}
\cleardoublepage
}

\renewcommand{\appendix}{
\cleardoublepage
\addtocline{ภาคผนวก}
{\centering\large\textbf{ภาคผนวก}\vspace{3\parskip}\par\noindent}
\normalsize
\stepcounter{unitclass}
\setcounter{equation}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
}
