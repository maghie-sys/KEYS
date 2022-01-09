//여기는 방탈출 테마 관리를 위함
class ExitTheme {
  //테마 구성요소 추가. 즉 정보들을 추가함.
  final String themetitle; //테마명
  final String themeposter; //방탈출 테마 이미지

  ExitTheme.fromMap(Map<String, dynamic> map)
      : themetitle = map['themetitle'],
        themeposter = map['themeposter'];

  @override
  String toString() => "ExitTheme<$themetitle>"; //인스턴스 출력을 용이하기 위해 설정
}
