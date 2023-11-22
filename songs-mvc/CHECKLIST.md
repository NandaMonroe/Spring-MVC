
- [ ] add the additional dependencies: search JPA, mySQL


- [ ] update [application.properties](./src/main/resources/application.properties)
- [ ] update [pom.xml](./pom.xml)

- [ ] create [SongController.java](./src/main/java/com/nandamonroe/songsmvc/controllers/SongController.java)
- [ ] create [SongApiController.java](./src/main/java/com/nandamonroe/songsmvc/controllers/SongApiController.java)

## layered model

- [ ] [Song.java](./src/main/java/com/nandamonroe/songsmvc/models/Song.java)
- [ ] [SongService.java](./src/main/java/com/nandamonroe/songsmvc/services/SongService.java)
- [ ] [SongRepository.java](./src/main/java/com/nandamonroe/songsmvc/repositories/SongRepository.java)

```mermaid
graph LR;
Controller<--> Service <--> Repository --> Database
```

- [ ] views [index.jsp](./src/main/webapp/WEB-INF/index.jsp)
