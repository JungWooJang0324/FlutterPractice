

class Note {
  //final => 값이 할당되면 변경하지 못하도록
  final String title;

  final  String body;

  //Note 안에 body 를 파라미터를 받는데 제목은 선택적으로 받도록 하려면 {해당 인자 = ''}
  Note(
      this.body,
      {this.title = '',
      });


}