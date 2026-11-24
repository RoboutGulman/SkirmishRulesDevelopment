// =====================================================================
// Gang Showdown / Wargame Rules Template (Common Library)
// =====================================================================

// Основная цветовая палитра Подулья
#let color-accent = rgb("#8a1414")     // Темно-красный (варгейм-акцент)
#let color-dark = rgb("#1a1a1a")       // Основной текст
#let color-border = rgb("#555555")     // Рамки
#let color-header-bg = rgb("#8a1414")  // Шапки таблиц
#let color-sub-bg = rgb("#f4e8e8")     // Подшапки таблиц
#let color-box-bg = rgb("#f7f3ee")     // Фон авторских плашек (пергамент)
#let color-box-border = rgb("#6b2a1a") // Рамка авторских плашек

#let project(
  title: "GANG SHOWDOWN",
  subtitle: "КНИГА ПРАВИЛ",
  version: "1.4",
  author: "JawRippa / ComboBreaker",
  print-friendly: false,
  body,
) = {
  set document(title: title + " — " + subtitle, author: author)

  // Фон страниц: легкий оттенок пергамента или чистый белый для печати
  let page-bg = if print-friendly {
    white
  } else {
    rgb("#fbf9f6")
  }

  set page(
    paper: "a4",
    margin: (x: 1.6cm, top: 2.0cm, bottom: 2.2cm),
    fill: page-bg,
    header: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        grid(
          columns: (1fr, 1fr),
          align(left)[#text(size: 8pt, fill: rgb("#777777"), weight: "bold", tracking: 0.1em)[#upper(title): #upper(subtitle)]],
          align(right)[#text(size: 8pt, fill: color-accent, weight: "bold")[v#version]]
        )
        v(-2pt)
        line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
      }
    },
    footer: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        align(center)[
          #box(
            stroke: 1pt + color-accent,
            radius: 3pt,
            inset: (x: 10pt, y: 3pt),
            fill: white,
            text(size: 9.5pt, weight: "bold", fill: color-accent)[#page-num]
          )
        ]
      }
    }
  )

  // Типографика
  set text(
    font: ("Calibri", "Arial"),
    size: 9.5pt,
    fill: color-dark,
    lang: "ru"
  )

  set par(
    justify: true,
    leading: 0.65em,
  )

  // Заголовки 1 уровня
  show heading.where(level: 1): it => block(width: 100%, below: 12pt, above: 16pt)[
    #align(center)[
      #text(
        size: 18pt,
        weight: "bold",
        fill: color-accent,
        tracking: 0.08em
      )[#upper(it.body)]
    ]
    #v(-6pt)
    #align(center)[#line(length: 60%, stroke: 1.5pt + color-accent)]
  ]

  // Заголовки 2 уровня
  show heading.where(level: 2): it => block(below: 8pt, above: 12pt)[
    #text(
      size: 12pt,
      weight: "bold",
      fill: color-accent,
      tracking: 0.05em
    )[#upper(it.body)]
    #v(-4pt)
    #line(length: 100%, stroke: 0.75pt + color-accent)
  ]

  // Заголовки 3 уровня
  show heading.where(level: 3): it => block(below: 6pt, above: 9pt)[
    #text(
      size: 10.5pt,
      weight: "bold",
      fill: rgb("#2a2a2a"),
    )[#it.body]
  ]

  // Ссылки
  show link: it => text(fill: color-accent, weight: "bold")[#it]

  // Списки
  set list(marker: text(fill: color-accent)[•], spacing: 0.6em)

  body
}
