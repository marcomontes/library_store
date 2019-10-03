# LIBRARY STORE API

### Create data using seed file
```
rails db:seed
```

### Set Rate Limit
* Use `limit` for request quantity
* Use `period` for time in seconds
```
config/initializers/rackattack.rb
```

### Run specs
```
bundle exec rspec
```

### Run the server on localhost
```
rails s
```

### Endpoints

#### Books Info
```
GET http://localhost:3000/api/v1/books/
```

* 200 OK RESPONSE
```
[
    {
        "id": 1,
        "title": "The Call of Cthulhu",
        "author": "Howard Phillips Lovecraft"
        "isbn": "0-87054-037-8",
        "price": 40,
        "short_description": "One of the feature stories of the Cthulhu Mythos, H.P. Lovecraft's 'the Call of Cthulhu' is a harrowing tale of the weakness of the human mind when confronted by powers and intelligences from beyond our world."
    },
    {
        "id": 2,
        "title": "A Treatise of the System of the World",
         "author": "Isaac Newton"
        "isbn": "9781511496421",
        "price": 30,
        "short_description": "Let us then assume the mean distance of the Moon, 60 semi-diameters of the Earth, and its periodic time in respect of the fixed Stars, d. 7h. 43', as Astronomers have determined it. And a body revolved in our air, near the surface of the Earth supposed at rest, by means of a centripetal force, which should be, to the lame force at the distance of the..."
    },
    {
        "id": 3,
        "title": "Seveneves",
        "author": "Neal Stephenson"
        "isbn": "0062334514",
        "price": 45,
        "short_description": "No slim fables or nerdy novellas for Stephenson: his visions are epic, and he requires whole worlds-and, in this case, solar systems-to accommodate them....Wise, witty, utterly well-crafted science fiction"
    }
]
```

#### Single Book Info
```
GET http://localhost:3000/api/v1/books/2
```

* 200 OK RESPONSE
```
{
    "id": 2,
    "title": "A Treatise of the System of the World",
    "author": "Isaac Newton",
    "isbn": "9781511496421",
    "price": 30,
    "short_description": "Let us then assume the mean distance of the Moon, 60 semi-diameters of the Earth, and its periodic time in respect of the fixed Stars, d. 7h. 43', as Astronomers have determined it. And a body revolved in our air, near the surface of the Earth supposed at rest, by means of a centripetal force, which should be, to the lame force at the distance of the..."
}
```

#### Create Book
```
POST http://localhost:3000/api/v1/books/2
```

* BODY
```
{ 
    book: { 
        title: 'The Road Ahead', 
        isbn: '100200', 
        price: 35, 
        author_id: 2
    }
}
```

#### Delete Book
```
DELETE http://localhost:3000/api/v1/books/2
```

* responses
- 202 Accepted
```
{
    "message": "Book deleted"
}
```
- 404 Not Found
```
{
    "message": "Couldn't find Book with 'id'=2"
}
```

#### Search books by title
```
GET http://localhost:3000/api/v1/books/search_by_title
```
* body
```
{
  "book":
    {
      "term": "call"
    }
}
```

* responses
- 200 OK
```
[
    {
        "id": 1,
        "title": "The Call of Cthulhu",
        "author": "Howard Phillips Lovecraft",
        "isbn": "0-87054-037-8",
        "price": 40,
        "short_description": "One of the feature stories of the Cthulhu Mythos, H.P. Lovecraft's 'the Call of Cthulhu' is a harrowing tale of the weakness of the human mind when confronted by powers and intelligences from beyond our world."
    }
]
```
- 422 Unprocessable Entity
```
{
    "msg": "We didn't find any books"
}
```

#### Search books by isbn
```
GET http://localhost:3000/api/v1/books/search_by_title
```
* body
```
{
  "book":
    {
      "term": "14"
    }
}
```

* responses
- 200 OK
```
[
    {
        "id": 2,
        "title": "A Treatise of the System of the World",
        "author": "Isaac Newton",
        "isbn": "9781511496421",
        "price": 30,
        "short_description": "Let us then assume the mean distance of the Moon, 60 semi-diameters of the Earth, and its periodic time in respect of the fixed Stars, d. 7h. 43', as Astronomers have determined it. And a body revolved in our air, near the surface of the Earth supposed at rest, by means of a centripetal force, which should be, to the lame force at the distance of the..."
    },
    {
        "id": 3,
        "title": "Seveneves",
        "author": "Neal Stephenson"
        "isbn": "0062334514",
        "price": 45,
        "short_description": "No slim fables or nerdy novellas for Stephenson: his visions are epic, and he requires whole worlds-and, in this case, solar systems-to accommodate them....Wise, witty, utterly well-crafted science fiction"
    }
]
```
- 422 Unprocessable Entity
```
{
    "msg": "We didn't find any books"
}
```