require "json"

# ----------------------------------- DESTROY ALL ------------------------------------

Bookmark.destroy_all
Review.destroy_all
Forbidden.destroy_all
User.destroy_all
Recipe.destroy_all
Cheese.destroy_all

# ----------------------------------- USER SEED ------------------------------------

emile = User.new(
  pseudo: "Emile Molette",
  email: "emile@gmail.com",
  password: "emile12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
emile.save!

feta = User.new(
  pseudo: "Feta Kostopoulos",
  email: "feta@gmail.com",
  password: "feta12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 0
)
feta.save!

camille = User.new(
  pseudo: "Camille Brie",
  email: "camille@gmail.com",
  password: "camille12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
camille.save!

pierre = User.new(
  pseudo: "Pierre Mont d'or",
  email: "pierre@gmail.com",
  password: "pierre12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
pierre.save!

felipe = User.new(
  pseudo: "Félipé Corino",
  email: "felipe@gmail.com",
  password: "felipe12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
felipe.save!

gaspare = User.new(
  pseudo: "Gaspare Mesan",
  email: "gaspare@gmail.com",
  password: "gaspare12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
gaspare.save!

massimo = User.new(
  pseudo: "Massimo Zarella",
  email: "massimo@gmail.com",
  password: "massimo12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
massimo.save!

akira = User.new(
  pseudo: "Akira Clette",
  email: "akira@gmail.com",
  password: "akira12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
akira.save!

emma = User.new(
  pseudo: "Emma Roilles",
  email: "emma@gmail.com",
  password: "emma12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
emma.save!

henri = User.new(
  pseudo: "Henri Cotta",
  email: "henri@gmail.com",
  password: "henri12345",
  score_search_vache: 10,
  score_search_chevre: 10,
  score_search_brebis: 10
)
henri.save!

# ----------------------------------- CHEESE SEED ------------------------------------

filepath = "lib/assets/cheese.json"

serialized_cheese = File.read(filepath)

cheeses = JSON.parse(serialized_cheese)

cheeses.each do |cheese|
  fromage = Cheese.new(cheese)
  fromage.save!
end

# ----------------------------------- REVIEWS SEED ------------------------------------

review1 = Review.new(
  { content: "Dégustation fantastique, je recommande ce fromage",
  rating: 5 }
)
review1.user = henri
fromage1 = Cheese.find_by_name("Vieux Lille")
review1.cheese = fromage1
review1.save!

review2 = Review.new(
  content: "Déçu par cette découverte, mais les goûts et les couleurs ça ne se discutent pas",
  rating: 4
)
review2.user = emma
fromage2 = Cheese.find_by_name("Tomme du Jura")
review2.cheese = fromage2
review2.save!

review3 = Review.new(
  content: "Merci Frometon pour le conseil sur le vin qui accompagnait ce fromage, le mariage était incroyable",
  rating: 5
)
review3.user = massimo
fromage3 = Cheese.find_by_name("Saint Paulin")
review3.cheese = fromage3
review3.save!

review4 = Review.new(
  content: "Une belle odeur, un goût intéressant, je recommande",
  rating: 4
)
review4.user = gaspare
fromage4 = Cheese.find_by_name("Picodon")
review4.cheese = fromage4
review4.save!

review5 = Review.new(
  content: "MON DIEU ! QUELLE EXPÉRIENCE GUSTATIIIIIIVE !!! Milles merci FROMETON",
  rating: 3
)
review5.user = felipe
fromage5 = Cheese.find_by_name("Mont ventoux")
review5.cheese = fromage5
review5.save!

review6 = Review.new(
  content: "Ce fromage ne pas fait voyager, alors ... c'est reparti pour une roulette",
  rating: 5
)
review6.user = pierre
fromage6 = Cheese.find_by_name("Pavé du Berry")
review6.cheese = fromage6
review6.save!

review7 = Review.new(
  content: "Parfait avec le vin conseillé par Frometon !",
  rating: 2
)
review7.user = camille
fromage7 = Cheese.find_by_name("Curé Nantais")
review7.cheese = fromage7
review7.save!

review8 = Review.new(
  content: "Un de mes préférés dans cette catégorie de pate !",
  rating: 3
)
review8.user = feta
fromage8 = Cheese.find_by_name("Livarot AOP")
review8.cheese = fromage8
review8.save!

review9 = Review.new(
  content: "Un repas de dingue, ce fromage est une merveille à cuisiner",
  rating: 4
)
review9.user = emile
fromage9 = Cheese.find_by_name("Grand Munster")
review9.cheese = fromage9
review9.save!

review10 = Review.new(
  content: "Trouvé dans un rayon de 100km autour de chez et en plus délicieux ! Que demander de plus",
  rating: 5
)
review10.user = massimo
fromage10 = Cheese.find_by_name("Feuille de Chèvre")
review10.cheese = fromage10
review10.save!

# ----------------------------------- BOOKMARKS SEED ------------------------------------

bookmark1 = Bookmark.new()
bookmark1.user = massimo
bookmark1.cheese = Cheese.find_by_name("Feuille de Chèvre")
bookmark1.save!

bookmark2 = Bookmark.new()
bookmark2.user = emile
bookmark2.cheese = Cheese.find_by_name("Grand Munster")
bookmark2.save!

bookmark3 = Bookmark.new()
bookmark3.user = feta
bookmark3.cheese = Cheese.find_by_name("Livarot AOP")
bookmark3.save!

bookmark4 = Bookmark.new()
bookmark4.user = camille
bookmark4.cheese = Cheese.find_by_name("Curé Nantais")
bookmark4.save!

bookmark5 = Bookmark.new()
bookmark5.user = felipe
bookmark5.cheese = Cheese.find_by_name("Pavé du Berry")
bookmark5.save!

bookmark6 = Bookmark.new()
bookmark6.user = emma
bookmark6.cheese = Cheese.find_by_name("Mont ventoux")
bookmark6.save!

bookmark7 = Bookmark.new()
bookmark7.user = gaspare
bookmark7.cheese = Cheese.find_by_name("Picodon")
bookmark7.save!

bookmark8 = Bookmark.new()
bookmark8.user = henri
bookmark8.cheese = Cheese.find_by_name("Saint Paulin")
bookmark8.save!

bookmark9 = Bookmark.new()
bookmark9.user = akira
bookmark9.cheese = Cheese.find_by_name("Tomme du Jura")
bookmark9.save!

bookmark10 = Bookmark.new()
bookmark10.user = massimo
bookmark10.cheese = Cheese.find_by_name("Vieux Lille")
bookmark10.save!

# ----------------------------------- FORBIDDEN SEED ------------------------------------

forbidden1 = Forbidden.new()
forbidden1.user = emile
forbidden1.cheese = Cheese.find_by_name("Couronne de Melle")
forbidden1.save!

forbidden2 = Forbidden.new()
forbidden2.user = camille
forbidden2.cheese = Cheese.find_by_name("Coulommiers")
forbidden2.save!

forbidden3 = Forbidden.new()
forbidden3.user = massimo
forbidden3.cheese = Cheese.find_by_name("Clacbitou")
forbidden3.save!

forbidden4 = Forbidden.new()
forbidden4.user = camille
forbidden4.cheese = Cheese.find_by_name("Brousse de Brebis")
forbidden4.save!

forbidden5 = Forbidden.new()
forbidden5.user = emma
forbidden5.cheese = Cheese.find_by_name("Briquette du Forez")
forbidden5.save!

forbidden6 = Forbidden.new()
forbidden6.user = henri
forbidden6.cheese = Cheese.find_by_name("Bleu de Severac")
forbidden6.save!

forbidden7 = Forbidden.new()
forbidden7.user = pierre
forbidden7.cheese = Cheese.find_by_name("Brie aux truffes")
forbidden7.save!

forbidden8 = Forbidden.new()
forbidden8.user = akira
forbidden8.cheese = Cheese.find_by_name("A Casinca")
forbidden8.save!

forbidden9 = Forbidden.new()
forbidden9.user = akira
forbidden9.cheese = Cheese.find_by_name("Abbaye de Timadeuc")
forbidden9.save!

forbidden10 = Forbidden.new()
forbidden10.user = gaspare
forbidden10.cheese = Cheese.find_by_name("Ardi-Gasna")
forbidden10.save!

# ----------------------------------- RECIPE SEED ------------------------------------

filepath_recipes = "lib/assets/recipes.json"

serialized_recipes = File.read(filepath_recipes)

recipes = JSON.parse(serialized_recipes)

recipes.each do |recipe|
  recette = Recipe.new(recipe)
  recette.cheese = Cheese.find_by_name(recipe["name"])
  if recette.valid?
    recette.save!
  else
    puts "Error: recipe '#{recipe['name']}' has invalid cheese"
    puts recette.errors.full_messages
  end
end
