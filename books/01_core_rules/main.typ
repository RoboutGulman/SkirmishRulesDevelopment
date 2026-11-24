#import "/common/template.typ": project
#import "/common/components.typ": *

#show: project.with(
  title: "GANG SHOWDOWN",
  subtitle: "КНИГА 1: ОСНОВНЫЕ ПРАВИЛА",
  version: "1.4",
  author: "JawRippa / ComboBreaker",
)

#include "chapters/01_intro.typ"
#pagebreak()
#include "chapters/02_turn_and_actions.typ"
#pagebreak()
#include "chapters/03_combat_and_damage.typ"
#pagebreak()
#include "chapters/04_quick_reference.typ"
