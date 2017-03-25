## shared-stumble-api 
_(Now __Shovelin__ Api)_

### Description

JSON api for the chrome extension [Shovelin](https://github.com/rrichardsonv/shovelin).
Built as a potential solution to sharing articles between my busy friends

### Routes

>GET ../../api/v1/links?key=**API_KEY**
* _DATA:_[ {'digger': **Name of Contributer**, 'url': **Site Url**, 'title': **Bookmark Title**} ] (max length: 5)

>GET ../../api/v1/links/random?key=**API_KEY**
* _DATA:_[ {'digger': **Name of Contributer**, 'url': **Site Url**, 'title': **Bookmark Title**} ] (with length of 1)

>POST ../../api/v1/links?key=**API_KEY**
* _EXPECTED DATA:_{  'bookmarks':{  links:[  {'title':**STRING**,'url':**STRING**}...  ]  }


>POST ../../api/v1/users
* _EXPECTED DATA:_{  'users':{  'name':**STRING**, 'email':**STRING**}  }



