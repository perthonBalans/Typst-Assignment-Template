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

// Some math operators
#let prox = [#math.op("prox")]
#let proj = [#math.op("proj")]
#let argmin = [#math.arg]+[#math.min]

// Initiate the document title, author...
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
