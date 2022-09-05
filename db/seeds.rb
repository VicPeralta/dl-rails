# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Student.create(id:'PLAYER-001', name: 'Jose Raul Capablanca')
Student.create(id:'PLAYER-002', name: 'Alexander Alekhine')
Student.create(id:'PLAYER-003', name: 'Anatoly Karpov')
Student.create(id:'PLAYER-004', name: 'Garry Kasparov')
Student.create(id:'PLAYER-005', name: 'Magnus Carlsen')


Course.create(id: 'CHESS-101', name: 'Tactics I')
Course.create(id: 'CHESS-102', name: 'Opennings I')
Course.create(id: 'CHESS-103', name: 'Middlegames I')
Course.create(id: 'CHESS-104', name: 'Middlegames I')
