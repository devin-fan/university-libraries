# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

    User.create!(role: 1, first_name: "Devin", last_name: "Fan")
    film = Film.new(title: 'Ten Minutes to Live', film_type: 1, director: 'Oscar Micheaux', base_film_path: 'uploads/base_films/test.mov', permission: 0, description: "Ten Minutes to Live is a 1932 American film directed by Oscar Micheaux.  A movie producer offers a nightclub singer a role in his latest film, but all he really wants to do is bed her. She knows, but accepts anyway. Meanwhile, a patron at the club gets a note saying that she'll soon get another note, and that she will be killed ten minutes after that.")
    film.update_column(:base_film_path, 'uploads/base_films/test.mov')
    film.save!
    film = Film.new(title: 'Swing', film_type: 1, director: 'Oscar Micheaux', base_film_path: 'uploads/base_films/test.mov', permission: 0, description: "Swing! is a 1938 American race film directed, produced and written by Oscar Micheaux.  Mandy Jenkins (Cora Green), an African American cook for a wealthy white family in Birmingham, Alabama, discovers her husband Cornell is having an affair with Eloise Jackson (Hazel Diaz). When she confronts her husband and Eloise at a nightclub, a violent fight ensues. Eloise leaves Birmingham and relocates to the Harlem section of New York City, where she gets a job as a cabaret vocalist under the false name of Cora Smith. She is followed to Harlem by her husband, Lem, who becomes mixed up in the local crime scene. Mandy also arrives in New York, having left Cornell. She gets a job as the wardrobe mistress at the cabaret where Eloise is performing. When Eloise breaks her leg during a drunken fall, Mandy is recruited as the last-minute substitute and becomes a musical star as the revue is transferred to Broadway. Cornell, who is now destitute, reunites with Mandy and agrees never to cheat on her again.")
    film.update_column(:base_film_path, 'uploads/base_films/test.mov')
    film.save!
    film = Film.new(title: 'The Notorious Elinor Lee', film_type: 1, director: 'Oscar Micheaux', base_film_path: 'uploads/base_films/test.mov', permission: 0, description: "The Notorious Elinor Lee is a 1940 race film directed, written, and co-produced by the African-American filmmaker Oscar Micheaux.  Elinor Lee, a gangster’s moll living in the Harlem section of New York City, has signed up-and-coming boxer Benny Blue to a 10-year contract. Lee and a pair of corrupt fight promoter scheme to build up Blue as a potential champion, with the goal of betting against him when they force him to take a dive in a champion fight. Lee conspires to hire Fredi, an old friend of Blue and an escaped convict hiding from the law, to be his sweetheart and to control him for Lee and her partners.
    The plans are derailed when Blue loses a key fight to a German boxer, but he works to regain his standing in the sport and is able to meet the German in a rematch after two years have passed. Lee and her partners bet against Blue, but they are financially ruined when Blue prevails in the fight and comes out the winner.")
    film.update_column(:base_film_path, 'uploads/base_films/test.mov')
    film.save!
    film = Film.new(title: 'Underworld', film_type: 1, director: 'Oscar Micheaux', base_film_path: 'uploads/base_films/test.mov', permission: 0, description: "A young college student falls under the influence of a murderous gambler.")
    film.update_column(:base_film_path, 'uploads/base_films/test.mov')
    film.save!
    film = Film.new(title: 'The Exile', film_type: 1, director: 'Oscar Micheaux', base_film_path: 'uploads/base_films/test.mov', permission: 0, description: "The Exile is a 1931 American film by Oscar Micheaux with the co-direction of the Dances and Ensemble by Leonard Harper. A drama–romance of the race film genre, it was Micheaux's first feature-length talkie, and the first African American talkie. Adapted from Micheaux's first novel, The Conquest (1913), it has some autobiographical elements: like the film's central character Jean Baptiste (played by Stanley Morrell), Micheaux spent several years as a cattle rancher in an otherwise all-white area of South Dakota.")
    film.update_column(:base_film_path, 'uploads/base_films/test.mov')
    film.save!
    film = Film.new(title: 'Devins Exile', film_type: 1, user_id: 1, director: 'Devin Fan', base_film_path: 'uploads/base_films/test.mov', permission: 0, description: "The Exile is a 1931 American film by Oscar Micheaux with the co-direction of the Dances and Ensemble by Leonard Harper. A drama–romance of the race film genre, it was Micheaux's first feature-length talkie, and the first African American talkie. Adapted from Micheaux's first novel, The Conquest (1913), it has some autobiographical elements: like the film's central character Jean Baptiste (played by Stanley Morrell), Micheaux spent several years as a cattle rancher in an otherwise all-white area of South Dakota.")
    film.update_column(:base_film_path, 'uploads/base_films/test.mov')
    film.save!
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
