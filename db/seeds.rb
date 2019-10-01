# Lovecraft Books
hp_lovecraft = Author.create(name: 'Howard Phillips', lastname: 'Lovecraft')

Book.create(
  title: 'The Call of Cthulhu',
  author: hp_lovecraft,
  isbn:   '0-87054-037-8',
  price:  40,
  short_description: "One of the feature stories of the Cthulhu Mythos, H.P. Lovecraft's 'the Call of Cthulhu' is a harrowing tale of the weakness of the human mind when confronted by powers and intelligences from beyond our world."
)

# Newton Books
isaac_newton = Author.create(name: 'Isaac', lastname: 'Newton')

Book.create(
  title: 'A Treatise of the System of the World',
  author: isaac_newton,
  isbn:   '9781511496421',
  price:  30,
  short_description: "Let us then assume the mean distance of the Moon, 60 semi-diameters of the Earth, and its periodic time in respect of the fixed Stars, d. 7h. 43', as Astronomers have determined it. And a body revolved in our air, near the surface of the Earth supposed at rest, by means of a centripetal force, which should be, to the lame force at the distance of the..."
)

# Stephenson books
neal_stephenson = Author.create(name: 'Neal', lastname: 'Stephenson')

Book.create(
  title: 'Seveneves',
  author: isaac_newton,
  isbn:   '0062334514',
  price:  45,
  short_description: "No slim fables or nerdy novellas for Stephenson: his visions are epic, and he requires whole worlds-and, in this case, solar systems-to accommodate them....Wise, witty, utterly well-crafted science fiction"
)
