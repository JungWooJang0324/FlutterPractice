import 'package:flutter/material.dart';
import 'package:sticky_note/data/note.dart';

class NoteListPage extends StatefulWidget{

  //람다로 받아주기
  @override
  State createState() => _NoteListPageState();
  // State createState() {
  //   return _NoteListPageState();
  // }


}

// _를 붙이는 이유: 현재 파일 안에서만 사용하기 위해서
class _NoteListPageState extends State<NoteListPage> {

  //노트목록 화면
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticky Note'),
      ),

      body: GridView(
        //노트 추가해주기
        children: _buildCards(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         //가로방향으로 설정할 사각형 갯수
         crossAxisCount: 2,

         //가로 방향 : 세로 방향 비율 (정사각형임으로 1)
         childAspectRatio: 1,
       ),

        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),

      ),

    );
  }

  List<Widget> _buildCards(){
    final notes = [
      Note(
        '''
Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia,[4] and the web from a single codebase.[5]
The first version of Flutter was known as codename "Sky" and ran on the Android operating system. It was unveiled at the 2015 Dart developer summit,[6] with the stated intent of being able to render consistently at 120 frames per second.[7] During the keynote of Google Developer Days in Shanghai, Google announced Flutter Release Preview 2, which is the last big release before Flutter 1.0. On December 4, 2018, Flutter 1.0 was released at the Flutter Live event, denoting the first "stable" version of the Framework. On December 11, 2019, Flutter 1.12 was released at the Flutter Interactive event.[8]
On May 6, 2020, the Dart SDK in version 2.8 and the Flutter in version 1.17.0 were released, where support was added to the Metal API, improving performance on iOS devices (approximately 50%), new Material widgets, and new network tracking.
The major components of Flutter include:
* Dart platform
* Flutter engine
* Foundation library
* Design-specific widgets
Dart platform
Flutter apps are written in the Dart language and make use of many of the language's more advanced features.[9]
On Windows, macOS, and Linux[10] Flutter runs in the Dart virtual machine, which features a just-in-time execution engine. While writing and debugging an app, Flutter uses Just In Time compilation, allowing for "hot reload", with which modifications to source files can be injected into a running application. Flutter extends this with support for stateful hot reload, where in most cases changes to source code are reflected immediately in the running app without requiring a restart or any loss of state.[11]
Release versions of Flutter apps are compiled with ahead-of-time (AOT) compilation on both Android and iOS,[12] making Flutter's high performance on mobile devices possible.
Flutter engine
Flutter's engine, written primarily in C++, provides low-level rendering support using Google's Skia graphics library. Additionally, it interfaces with platform-specific SDKs such as those provided by Android and iOS.[9] The Flutter Engine is a portable runtime for hosting Flutter applications. It implements Flutter's core libraries, including animation and graphics, file and network I/O, accessibility support, plugin architecture, and a Dart runtime and compile toolchain. Most developers interact with Flutter via the Flutter Framework, which provides a reactive framework and a set of platform, layout, and foundation widgets.
Foundation library
The Foundation library, written in Dart, provides basic classes and functions that are used to construct applications using Flutter, such as APIs to communicate with the engine.[9][13]
Design-specific widgets
The Flutter framework contains two sets of widgets that conform to specific design languages: Material Design widgets implement Google's design language of the same name, and Cupertino widgets implement Apple's iOS Human interface guidelines.[9][14][15][16]
''',
        title: 'About Flutter',
      ),
      Note('클래스 101 강의 신청하기'),
      Note('목요일까지 관리비 납부하기'),
      Note(
        '''
- 🧅 양파 1망
- 🥬 양배추 1통
- 🍊 귤 1박스
- 🐔 손질 닭고기 1팩
- 🥓 삼겹살 1팩
- 🍜 우동면 1팩 (4입)
- 🥛 우유 2팩
- 🍞 식빵 1개
  ''',
        title: '장보기 목록',
      ),
      Note(
        '''
- 파이어베이스 프로젝트
- 애드몹 계정
- 구글 플레이 개발자 계정
- 애플 개발자 계정
  ''',
        title: '만들어야 할 것들',
      ),
      Note('목요일 오후 7시 강남역 11번출구'),
      Note('플러터 위젯 공부하기 - CircleAvatar'),
    ];
    //note 함수 위젯으로 변환
    return notes.map((note) => _buildCard(note)).toList();
  }


  //카드 위젯으로 받아주기
  Widget _buildCard(Note note){
    return Card(
      //약간의 공간을 주기 위해서 padding 주기
      child:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          //세로방향 크기
          mainAxisSize: MainAxisSize.min,
          //컬럼 내부 위젯 가로 방향 정렬
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title.isEmpty ? '(제목없음)': note.title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),

           //간격
           SizedBox(height: 16.0),
           //본문 위젯
            //카드영역을 남은 영역을 모두 활용할 수 있도록 Expended widget 으로 감싸줌
            Expanded(
              child : Text(
                  note.body,
                  overflow: TextOverflow.fade),
            ),

          ],
        )

      ),

    );
  }
}