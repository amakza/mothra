# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Service.create([
  { name: 'ポイント貯める',     code: 'PT' },
  { name: 'Wow!ポイント貯める', code: 'WP' },
  { name: 'スマートパス',       code: 'SP' },
  { name: 'Webポータル',        code: 'WP' },
  { name: 'UQライフ',           code: 'UQ' },
  { name: 'au占い',             code: 'FT' },
  { name: 'auゲーム',           code: 'GA' },
  { name: 'ゲームギフト',       code: 'GG' }
])

QualityPointSection.create([
  { name: 'Grand Design Review' },
  { name: 'Development' },
  { name: 'Infrastructure' },
  { name: 'Release' }
])

QualityPoint.create([
  { section_id: 1, question: 'Section 1 Question 1', is_shown: true, warnings: 'Warning 1' },
  { section_id: 1, question: 'Section 1 Question 2', is_shown: true },
  { section_id: 1, question: 'Section 1 Question 3', is_shown: true },

  { section_id: 2, question: 'Section 2 Question 1', is_shown: true },
  { section_id: 2, question: 'Section 2 Question 2', is_shown: true },
  { section_id: 2, question: 'Section 2 Question 3', is_shown: true, warnings: 'Warning 1' },

  { section_id: 3, question: 'Section 3 Question 1', is_shown: true },
  { section_id: 3, question: 'Section 3 Question 2', is_shown: true },
  { section_id: 3, question: 'Section 3 Question 3', is_shown: true, warnings: 'Warning 1' },

  { section_id: 4, question: 'Section 4 Question 1', is_shown: true },
  { section_id: 4, question: 'Section 4 Question 2', is_shown: true },
  { section_id: 4, question: 'Section 4 Question 3', is_shown: true },
])
