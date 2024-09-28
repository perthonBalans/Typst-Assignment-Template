#let problem_counter = counter("problem")

#let prob(title, body, alignment: top + start) = {
  [== Problem #problem_counter.step() #problem_counter.display(): _ #title _]
  block(
    fill:rgb(250, 255, 250),
    width: 100%,
    inset:8pt,
    radius: 4pt,
    stroke:rgb(31, 199, 31),
    align(alignment)[#body]
  )
}

#let prox = [#math.op("prox")]
#let proj = [#math.op("proj")]
#let argmin = [#math.arg]+[#math.min]

#let assignment_class(title, author, course_id, professor_name, semester, due_time, body) = {
  set document(title: title, author: author)
  set page(
    paper:"us-letter", 
    header: locate( 
      loc => 
        if (counter(page).at(loc).first()==1) { 
          none
        } else { 
          align(right)[*#author* | *#course_id: #title*]
        }
    ), 
    footer: locate(loc => {
      let page_number = counter(page).at(loc).first()
      let total_pages = counter(page).final(loc).last()
      align(center)[Page #page_number of #total_pages]
    })
  )
  block(height:25%,fill:none)
  align(center, text(17pt)[
    *#course_id: #title*
  ])
  align(center, text(10pt)[
    Due on #due_time
  ])
  align(center, [_Prof. #professor_name _, #semester])
  block(height:35%,fill:none)
  align(center)[*#author*]
  align(center, text(10pt)[
    #datetime.today().display()
  ])
  
  pagebreak(weak: false)
  body
}

#let title = "Linear Algebra Homework"
#let author = "John Doe"
#let course_id = "MATH099"
#let instructor = "Prof. Banana"
#let semester = "Fall 2024"
#let due_day = "October 15, 2024"
#set enum(numbering: "a)")
#show: assignment_class.with(title, author, course_id, instructor, semester, due_day)

#prob("Projecting a Vector")[
  1. when $min(norm(bold(x))_2)$, $bold(x) = bold(x^*)$ is the solution to the problem, which is $x^*=vec(1/sqrt(3),1/sqrt(3),1/sqrt(3))$

  2. We have a matrix $bold(A) = mat(1,1;1,1;1,0)$, the projection operator is $ bold(P) = bold(A)(bold(A)^T A)^(-1)bold(A)^T = mat(1/2,1/2,0;1/2,1/2,0;0,0,1), $ hence, $ bold(x^*) = bold(P) bold(v)  = vec(1/2,1/2,1). $ 
  
  3. We have a  matrix $bold(A) = mat(1,-1;-1,1;2,2)$, the projection operator is $ bold(P) = bold(A)(bold(A)^T A)^(-1)bold(A)^T = mat(1/2,-1/2,0;-1/2,1/2,0;0,0,1), $ hence, $ bold(x^*) = bold(P) bold(v)  = vec(1/2,-1/2,0). $
]

#prob("How many genes for each chromosome?", alignment: center)[
  1. Codes: `zcat annotation.gtf.gz | cut -f 9 | cut -d ";" -f 1 | grep ENSG | cut -d " " -f 2 | cut -d "." -f 1 | uniq | wc -l`
  
  2. 
  #table(
    columns: (auto, auto),
    table.header(
      [*Chromosome*], [*Counts*],
    ),
    "chr1", "5659",
    "chr2", "4344",
    "chr3", "3303",
    "chr4", "2732",
    "chr5", "3074",
    "chr6", "3182",
    "chr7", "3147",
    "chr8", "2541",
    "chr9", "2417",
    "chr10", "2428",
    "chr11", "3468",
    "chr12", "3143",
    "chr13", "1457",
    "chr14", "2341",
    "chr15", "2322",
    "chr16", "2672",
    "chr17", "3162",
    "chr18", "1265",
    "chr19", "3076",
    "chr20", "1502",
    "chr21", "898",
    "chr22", "1445",
    "chrX", "2484",
    "chrY", "601",
    "chrM", "37"
  )
]
