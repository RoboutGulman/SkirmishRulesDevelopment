// =====================================================================
// Глава 2: Дом Голиаф (House Goliath)
// =====================================================================

#import "/common/components.typ": fighter-card, skill-matrix, callout

= Дом Голиаф (House Goliath)

Голиафы — гиганты и тяжелоатлеты Подулья, генетически модифицированные для каторжного труда на плавильнях и в шахтах. В бою они полагаются на грубую физическую мощь, тяжелое оружие ближнего боя и стимуляторы.

#callout(title: "Особое правило Дома: Генная кузница (Gene-smithing)")[
  Каждый боец Голиафов может перед началом кампании или при найме получить одну генную модификацию за соответствующую доплату в кредитах (например, +1 к Стойкости за 30 кр., или иммунитет к действию токсинов за 15 кр.).
]

== Состав банды Дома Голиаф

#fighter-card(
  name: "Тиран (Forge Tyrant)",
  title-suffix: "Лидер банды",
  cost: "130 кредитов",
  stats: (m: "4\"", ws: "3+", bs: "3+", s: "4", t: "4", w: "2", i: "4+", a: "3", ld: "5+", cl: "5+", wil: "7+", int: "7+"),
  equipment: ("Боевой тесак", "Бронежилет (Flak Armour)"),
  skills: ("Bullcharge", "Nerves of Steel"),
  rules: (
    "Активация группы (Group Activation 2): может активировать до 2 бойцов в пределах 4\".",
    "Лидер (Leader): союзники в пределах 6\" используют его показатель Ld для проверок.",
  )
)

#v(10pt)

#fighter-card(
  name: "Босс кузницы (Forge Boss)",
  title-suffix: "Чемпион",
  cost: "95 кредитов",
  stats: (m: "4\"", ws: "3+", bs: "4+", s: "4", t: "4", w: "2", i: "4+", a: "2", ld: "6+", cl: "6+", wil: "7+", int: "8+"),
  equipment: ("Тяжелый клуб", "Пистолет Stub Gun"),
  skills: ("True Grit"),
  rules: (
    "Активация группы (Group Activation 1): может активировать 1 бойца в пределах 4\".",
  )
)

#v(10pt)

#fighter-card(
  name: "Громила (Bruiser)",
  title-suffix: "Рядовой гангер",
  cost: "55 кредитов",
  stats: (m: "4\"", ws: "4+", bs: "4+", s: "4", t: "4", w: "1", i: "4+", a: "1", ld: "7+", cl: "6+", wil: "8+", int: "9+"),
  equipment: ("Тесак или Дробовик на выбор"),
  skills: (),
  rules: (
    "Рядовой (Ganger): может повышаться до Специалиста при получении опыта.",
  )
)

#v(10pt)

#fighter-card(
  name: "Задира (Bully)",
  title-suffix: "Юнец / Проспект",
  cost: "35 кредитов",
  stats: (m: "5\"", ws: "4+", bs: "5+", s: "3", t: "4", w: "1", i: "4+", a: "1", ld: "8+", cl: "7+", wil: "8+", int: "9+"),
  equipment: ("Автопистолет"),
  skills: (),
  rules: (
    "Быстрый рост (Fast Learner): получает опыт (XP) с бонусом +1 за каждое выведение врага из строя.",
  )
)

== Матрица навыков Голиафов

#skill-matrix(
  rows: (
    (role: "Тиран (Лидер)", agility: "-", brawn: "О", combat: "О", cunning: "В", ferocity: "О", leadership: "О", shooting: "В", savagery: "О"),
    (role: "Босс (Чемпион)", agility: "-", brawn: "О", combat: "О", cunning: "-", ferocity: "О", leadership: "В", shooting: "В", savagery: "О"),
    (role: "Специалист", agility: "-", brawn: "В", combat: "В", cunning: "-", ferocity: "О", leadership: "-", shooting: "О", savagery: "В"),
    (role: "Громила (Гангер)", agility: "-", brawn: "В", combat: "В", cunning: "-", ferocity: "В", leadership: "-", shooting: "-", savagery: "-"),
    (role: "Задира (Юнец)", agility: "В", brawn: "В", combat: "В", cunning: "-", ferocity: "В", leadership: "-", shooting: "-", savagery: "-"),
  )
)

#text(size: 8pt, style: "italic")[Обозначения: *О* — Основной навык (Primary, дешевле прокачка), *В* — Вторичный навык (Secondary), *-* — Недоступен напрямую.]
