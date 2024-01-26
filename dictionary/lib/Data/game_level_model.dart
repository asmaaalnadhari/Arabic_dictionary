class GameLevel{
 final String numLevel;
 final String nameLevel;
 final String imgLevel;

  GameLevel( {required this.numLevel, required this.nameLevel, required this.imgLevel});
}
List<GameLevel> myLevels=[
GameLevel(numLevel: 'المستوئ الأول', nameLevel: 'الأخلاق', imgLevel: "assets/Image/polite.png"),
 GameLevel(numLevel: ' المستوئ الثاني ', nameLevel: "حياة الأنبياء", imgLevel:"assets/Image/book_level.png"),
 GameLevel(numLevel: 'المستوئ الثالث', nameLevel: 'حيوانات ذكرت في القران', imgLevel: "assets/Image/animals_level.png"),
];