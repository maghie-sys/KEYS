//여기는 방탈출 데이터 관리를 위함
class Exit {
  //방탈출 카페 구성요소 추가. 즉 정보들을 추가함.
  final String title; //제목
  final String keywords; //키워드(공포/호러 등등)
  final String poster; //방탈출 업체 이미지
  final bool like; //좋아요나 찜에 쓸 부분

  Exit.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keywords = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  @override
  String toString() => "Exit<$title:$keywords>"; //인스턴스 출력을 용이하기 위해 설정
}
