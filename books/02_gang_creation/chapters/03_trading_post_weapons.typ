// =====================================================================
// Глава 3: Торговый пост — Оружие (Trading Post Weapons)
// =====================================================================

#import "/common/components.typ": weapon-table

= Торговый пост: Арсенал оружия

Оружие разделено по категориям. Бойцы могут приобретать оружие из Списка Дома (House Equipment List) по базовой стоимости или на общем Торговом посту.

== Базовое стрелковое оружие (Basic Weapons)

#weapon-table(
  category: "Базовое оружие",
  items: (
    (name: "Автоган (Autogun)", rng-s: "8\"", rng-l: "24\"", acc-s: "+1", acc-l: "-", str: "3", ap: "-", d: "1", am: "4+", traits: "Rapid Fire (1)", cost: "15 кр.", rarity: "О"),
    (name: "Лазган (Lasgun)", rng-s: "18\"", rng-l: "24\"", acc-s: "+1", acc-l: "-", str: "3", ap: "-", d: "1", am: "2+", traits: "Plentiful", cost: "15 кр.", rarity: "О"),
    (name: "Дробовик (Shotgun - Solid)", rng-s: "8\"", rng-l: "16\"", acc-s: "+1", acc-l: "-", str: "4", ap: "-", d: "2", am: "4+", traits: "Knockback", cost: "30 кр.", rarity: "О"),
    (name: "Дробовик (Shotgun - Scatter)", rng-s: "4\"", rng-l: "8\"", acc-s: "+2", acc-l: "-", str: "2", ap: "-", d: "1", am: "4+", traits: "Scatter", cost: "-", rarity: "-"),
    (name: "Болтер (Boltgun)", rng-s: "12\"", rng-l: "24\"", acc-s: "+1", acc-l: "-", str: "4", ap: "-1", d: "2", am: "6+", traits: "Rapid Fire (1)", cost: "55 кр.", rarity: "Р (8)"),
  )
)

== Пистолеты (Pistols)

#weapon-table(
  category: "Пистолеты",
  items: (
    (name: "Автопистолет (Autopistol)", rng-s: "4\"", rng-l: "12\"", acc-s: "+1", acc-l: "-", str: "3", ap: "-", d: "1", am: "4+", traits: "Sidearm, Rapid Fire (1)", cost: "10 кр.", rarity: "О"),
    (name: "Стаб-ган (Stub Gun)", rng-s: "6\"", rng-l: "12\"", acc-s: "+2", acc-l: "-", str: "3", ap: "-", d: "1", am: "4+", traits: "Sidearm", cost: "5 кр.", rarity: "О"),
    (name: "Болт-пистолет (Bolt Pistol)", rng-s: "6\"", rng-l: "12\"", acc-s: "+1", acc-l: "-", str: "4", ap: "-1", d: "2", am: "6+", traits: "Sidearm", cost: "45 кр.", rarity: "Р (8)"),
    (name: "Плазма-пистолет (Низк.)", rng-s: "6\"", rng-l: "12\"", acc-s: "+2", acc-l: "-", str: "5", ap: "-1", d: "1", am: "5+", traits: "Sidearm", cost: "50 кр.", rarity: "Р (9)"),
    (name: "Плазма-пистолет (Макс.)", rng-s: "6\"", rng-l: "12\"", acc-s: "+1", acc-l: "-", str: "7", ap: "-2", d: "2", am: "5+", traits: "Sidearm, Unstable", cost: "-", rarity: "-"),
  )
)

== Оружие ближнего боя (Melee Weapons)

#weapon-table(
  category: "Ближний бой",
  items: (
    (name: "Боевой нож (Fighting Knife)", rng-s: "E", rng-l: "-", acc-s: "-", acc-l: "-", str: "S", ap: "-1", d: "1", am: "-", traits: "Backstab, Melee", cost: "15 кр.", rarity: "О"),
    (name: "Цепной меч (Chainsword)", rng-s: "E", rng-l: "-", acc-s: "+1", acc-l: "-", str: "S+1", ap: "-1", d: "1", am: "-", traits: "Parry, Rending, Melee", cost: "25 кр.", rarity: "Р (7)"),
    (name: "Спад-джек Голиафов", rng-s: "E", rng-l: "-", acc-s: "-", acc-l: "-", str: "S+1", ap: "-", d: "1", am: "-", traits: "Knockback, Melee", cost: "15 кр.", rarity: "О"),
    (name: "Силовой топор (Power Axe)", rng-s: "E", rng-l: "-", acc-s: "-", acc-l: "-", str: "S+2", ap: "-2", d: "2", am: "-", traits: "Power, Disarm, Melee", cost: "35 кр.", rarity: "Р (8)"),
  )
)

== Специальное и Тяжелое оружие (Special & Heavy)

#weapon-table(
  category: "Тяжелое и специальное вооружение",
  items: (
    (name: "Гранатомет (Frag)", rng-s: "6\"", rng-l: "24\"", acc-s: "-", acc-l: "-1", str: "3", ap: "-", d: "1", am: "6+", traits: "Blast (3\"), Knockback", cost: "65 кр.", rarity: "Р (8)"),
    (name: "Гранатомет (Krak)", rng-s: "6\"", rng-l: "24\"", acc-s: "-", acc-l: "-1", str: "6", ap: "-2", d: "D3", am: "6+", traits: "-", cost: "-", rarity: "-"),
    (name: "Плазмаган (Низк.)", rng-s: "12\"", rng-l: "24\"", acc-s: "+2", acc-l: "-", str: "5", ap: "-1", d: "1", am: "5+", traits: "Rapid Fire (1)", cost: "100 кр.", rarity: "Р (9)"),
    (name: "Тяжелый стаббер", rng-s: "20\"", rng-l: "40\"", acc-s: "-", acc-l: "-1", str: "4", ap: "-1", d: "1", am: "4+", traits: "Rapid Fire (2), Unwieldy", cost: "130 кр.", rarity: "Р (7)"),
  )
)
