// =====================================================================
// Gang Showdown / Wargame Components Library (Common)
// =====================================================================

#import "/common/template.typ": color-accent, color-dark, color-border, color-header-bg, color-sub-bg, color-box-bg, color-box-border

// ---------------------------------------------------------------------
// 1. Плашка-выноска (Callout Box / Правило / Заметка автора)
// ---------------------------------------------------------------------
#let callout(title: none, body, fill: color-box-bg, border: color-box-border) = {
  block(
    width: 100%,
    stroke: (left: 3pt + border, rest: 0.5pt + rgb("#d0c8b8")),
    fill: fill,
    inset: (x: 10pt, top: 8pt, bottom: 8pt),
    radius: (right: 3pt),
    spacing: 10pt,
  )[
    #if title != none [
      #text(weight: "bold", fill: border, size: 10pt)[#title]
      #v(3pt)
    ]
    #body
  ]
}

// ---------------------------------------------------------------------
// 2. Карточка бойца (Fighter Stat Card)
// ---------------------------------------------------------------------
// stats: (m: "5\"", ws: "3+", bs: "4+", s: "4", t: "4", w: "2", i: "4+", a: "2", ld: "6+", cl: "5+", wil: "8+", int: "7+")
#let fighter-card(
  name: "Боец",
  title-suffix: none,
  cost: "100 кр.",
  stats: (:),
  equipment: (),
  rules: (),
  skills: (),
) = {
  block(
    width: 100%,
    stroke: 1pt + color-border,
    radius: 4pt,
    clip: true,
    spacing: 10pt,
  )[
    // Заголовок карточки
    #grid(
      columns: (1fr, auto),
      fill: color-header-bg,
      inset: (x: 8pt, y: 5pt),
      align: (left + horizon, right + horizon),
      text(fill: white, weight: "bold", size: 10.5pt)[
        #name #if title-suffix != none [#text(fill: rgb("#ffd5d5"), size: 9pt)[(#title-suffix)]]
      ],
      text(fill: white, weight: "bold", size: 10.5pt)[#cost]
    )

    // Таблица характеристик (12 статов Necromunda)
    #table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      align: center + horizon,
      stroke: (x, y) => if y == 0 { (bottom: 0.75pt + color-border) } else { 0.5pt + rgb("#e0dcd5") },
      fill: (x, y) => if y == 0 { color-sub-bg } else { white },
      inset: 4pt,
      // Шапка
      [*M*], [*WS*], [*BS*], [*S*], [*T*], [*W*], [*I*], [*A*], [*Ld*], [*Cl*], [*Wil*], [*Int*],
      // Значения
      [#stats.at("m", default: "-")],
      [#stats.at("ws", default: "-")],
      [#stats.at("bs", default: "-")],
      [#stats.at("s", default: "-")],
      [#stats.at("t", default: "-")],
      [#stats.at("w", default: "-")],
      [#stats.at("i", default: "-")],
      [#stats.at("a", default: "-")],
      [#stats.at("ld", default: "-")],
      [#stats.at("cl", default: "-")],
      [#stats.at("wil", default: "-")],
      [#stats.at("int", default: "-")]
    )

    // Дополнительные свойства (экипировка, правила, навыки)
    #let to-arr(val) = {
      if type(val) == array { val }
      else if type(val) == str { if val != "" { (val,) } else { () } }
      else { () }
    }
    #let eq-arr = to-arr(equipment)
    #let sk-arr = to-arr(skills)
    #let ru-arr = to-arr(rules)
    #let has-extra = eq-arr.len() > 0 or ru-arr.len() > 0 or sk-arr.len() > 0
    #if has-extra [
      #block(fill: rgb("#faf8f5"), inset: 6pt, width: 100%)[
        #if eq-arr.len() > 0 [
          #text(weight: "bold", size: 8.5pt, fill: color-accent)[Базовая экипировка:]
          #text(size: 8.5pt)[ #eq-arr.join(", ") \ ]
        ]
        #if sk-arr.len() > 0 [
          #text(weight: "bold", size: 8.5pt, fill: color-accent)[Стартовые навыки:]
          #text(size: 8.5pt)[ #sk-arr.join(", ") \ ]
        ]
        #if ru-arr.len() > 0 [
          #text(weight: "bold", size: 8.5pt, fill: color-accent)[Особые правила:]
          #list(..ru-arr.map(r => text(size: 8.5pt)[#r]))
        ]
      ]
    ]
  ]
}

// ---------------------------------------------------------------------
// 3. Таблица профилей оружия (Weapon Table)
// ---------------------------------------------------------------------
// items: (
//   (name: "Автоган", rng-s: "8\"", rng-l: "24\"", acc-s: "+1", acc-l: "-", str: "3", ap: "-", d: "1", am: "4+", traits: "Rapid Fire (1)", cost: "15 кр.", rarity: "О"),
// )
#let weapon-table(category: none, items: ()) = {
  let headers = (
    [*Оружие*],
    [*Дальн. (S / L)*],
    [*Точн. (S / L)*],
    [*S*],
    [*AP*],
    [*D*],
    [*AM*],
    [*Свойства*],
    [*Цена*],
    [*Редк.*],
  )

  let rows = ()
  for item in items {
    let rng = if item.at("rng-s", default: "-") == "-" and item.at("rng-l", default: "-") == "-" {
      "-"
    } else {
      item.at("rng-s", default: "E") + " / " + item.at("rng-l", default: "-")
    }
    let acc = item.at("acc-s", default: "-") + " / " + item.at("acc-l", default: "-")

    rows.push([*#item.name*])
    rows.push([#rng])
    rows.push([#acc])
    rows.push([#item.at("str", default: "-")])
    rows.push([#item.at("ap", default: "-")])
    rows.push([#item.at("d", default: "1")])
    rows.push([#item.at("am", default: "-")])
    rows.push([#text(size: 8pt)[#item.at("traits", default: "-")]])
    rows.push([#item.at("cost", default: "-")])
    rows.push([#item.at("rarity", default: "О")])
  }

  block(width: 100%, spacing: 8pt)[
    #if category != none [
      #text(weight: "bold", fill: color-accent, size: 10pt)[#upper(category)]
      #v(2pt)
    ]
    #table(
      columns: (2.2fr, 1.4fr, 1.1fr, 0.6fr, 0.6fr, 0.5fr, 0.7fr, 2.5fr, 0.9fr, 0.6fr),
      align: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, left + horizon, center + horizon, center + horizon),
      stroke: 0.5pt + rgb("#d0c8b8"),
      fill: (col, row) => if row == 0 {
        color-sub-bg
      } else if calc.even(row) {
        rgb("#fbf9f6")
      } else {
        white
      },
      inset: (x: 4pt, y: 4.5pt),
      ..headers,
      ..rows,
    )
  ]
}

// ---------------------------------------------------------------------
// 4. Таблица снаряжения (Wargear / Armour Table)
// ---------------------------------------------------------------------
#let wargear-table(category: none, items: ()) = {
  let headers = ([*Предмет*], [*Цена*], [*Редкость*], [*Эффект и описание*])
  let rows = ()
  for item in items {
    rows.push([*#item.name*])
    rows.push([#item.at("cost", default: "-")])
    rows.push([#item.at("rarity", default: "О")])
    rows.push([#text(size: 8.5pt)[#item.at("effect", default: "-")]])
  }

  block(width: 100%, spacing: 8pt)[
    #if category != none [
      #text(weight: "bold", fill: color-accent, size: 10pt)[#upper(category)]
      #v(2pt)
    ]
    #table(
      columns: (1.5fr, 0.8fr, 0.8fr, 4fr),
      align: (left + top, center + top, center + top, left + top),
      stroke: 0.5pt + rgb("#d0c8b8"),
      fill: (col, row) => if row == 0 {
        color-sub-bg
      } else if calc.even(row) {
        rgb("#fbf9f6")
      } else {
        white
      },
      inset: (x: 5pt, y: 5pt),
      ..headers,
      ..rows,
    )
  ]
}

// ---------------------------------------------------------------------
// 5. Таблица D66 (Травмы, События, Сценарии)
// ---------------------------------------------------------------------
#let d66-table(title: none, items: ()) = {
  let headers = ([*D66*], [*Название*], [*Описание эффекта*])
  let rows = ()
  for item in items {
    rows.push([*#item.roll*])
    rows.push([*#item.name*])
    rows.push([#text(size: 8.5pt)[#item.effect]])
  }

  block(width: 100%, spacing: 8pt)[
    #if title != none [
      #text(weight: "bold", fill: color-accent, size: 11pt)[#title]
      #v(2pt)
    ]
    #table(
      columns: (0.7fr, 1.8fr, 4.5fr),
      align: (center + horizon, left + horizon, left + horizon),
      stroke: 0.5pt + rgb("#d0c8b8"),
      fill: (col, row) => if row == 0 {
        color-header-bg
      } else if calc.even(row) {
        rgb("#fbf9f6")
      } else {
        white
      },
      inset: (x: 5pt, y: 5pt),
      ..headers.map(h => text(fill: white, weight: "bold")[#h]),
      ..rows,
    )
  ]
}

// ---------------------------------------------------------------------
// 6. Матрица навыков банды (Skill Matrix)
// ---------------------------------------------------------------------
// rows: (
//   (role: "Лидер", agility: "В", brawn: "О", combat: "О", cunning: "В", ferocity: "О", leadership: "О", shooting: "-", savagery: "-"),
// )
#let skill-matrix(rows: ()) = {
  let headers = (
    [*Роль бойца*],
    [*Agility*],
    [*Brawn*],
    [*Combat*],
    [*Cunning*],
    [*Ferocity*],
    [*Leadership*],
    [*Shooting*],
    [*Savagery*],
  )
  let table-cells = ()
  for r in rows {
    table-cells.push([*#r.role*])
    table-cells.push([#r.at("agility", default: "-")])
    table-cells.push([#r.at("brawn", default: "-")])
    table-cells.push([#r.at("combat", default: "-")])
    table-cells.push([#r.at("cunning", default: "-")])
    table-cells.push([#r.at("ferocity", default: "-")])
    table-cells.push([#r.at("leadership", default: "-")])
    table-cells.push([#r.at("shooting", default: "-")])
    table-cells.push([#r.at("savagery", default: "-")])
  }

  table(
    columns: (2.2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (left + horizon, ..(center + horizon,) * 8),
    stroke: 0.5pt + rgb("#d0c8b8"),
    fill: (col, row) => if row == 0 {
      color-sub-bg
    } else if calc.even(row) {
      rgb("#fbf9f6")
    } else {
      white
    },
    inset: 4pt,
    ..headers,
    ..table-cells,
  )
}
