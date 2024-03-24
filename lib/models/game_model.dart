import 'package:floor/floor.dart';

@entity
class Game {
  @PrimaryKey(autoGenerate: true)
  final int id = 0;
  final String name;
  final String img;
  final String bg;
  final String path;

  Game({
    required this.name,
    required this.bg,
    required this.path,
    required this.img,
  });
}

@dao
abstract class GameDao {
  @Query('SELECT * FROM Game')
  Future<List<Game>> findAll();

  @Query('SELECT name from Game')
  Stream<List<String>> findAllName();

  @insert
  Future<void> insertGame(Game game);

  @Query('DELETE * FROM Game')
  Future<void> clearAll();
}

List<Game> getGameList() {
  final list = [
    Game(
      name: "The legend of Zelda breath of the wild",
      path: "",
      bg: "C:/WFL/coves/The legend of Zelda breath of the wild __hero.jpg",
      img: "C:/WFL/coves/The legend of Zelda breath of the wild __cover.jpg",
    ),
    // Game(
    //   name: "Resident Evil",
    //path: "",
    //bg: "https://image.api.playstation.com/vulcan/ap/rnd/202210/0712/BiS5QP6h4506JHyJlZlVzK9D.jpg",
    //   img:
    //       "https://th.bing.com/th/id/R.901287d9b78029a093d38dfa9b41268b?rik=bTvbQtnc%2fgxa3w&riu=http%3a%2f%2fconceptartworld.com%2fwp-content%2fuploads%2f2018%2f04%2fThe-Art-of-God-of-War-Cover-01.jpg&ehk=Q4T7cWh5bUjoYS7UzHtn635cKilPlImyMFYLHpaAQJY%3d&risl=&pid=ImgRaw&r=0",
    // ),
    Game(
      name: "Resident Evil",
      path: "",
      bg: "C:/WFL/coves/Resident-Evil-4_remake___hero.png",
      img: "C:/WFL/coves/Resident Evil 4(remake)__cover.png",
    ),
  ];

  return List.from(list);
}
