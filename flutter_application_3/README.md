# state
- State란 UI가 변경되도록 영향을 미친느 데이터이다.
- App 수준과 Widget 수준의 데이터가 있다.
  -- App수준: 로그인
  -- Widget수준: 라디오 버튼, inputText

# StatelessWidget
- State가 변하지 않는 위젯
  -- 한 번 정의된 레이아웃이나 텍스트 등..

# Widget tree, Element tree, Render tree
- Widget tree: MyApp, Scaffold, Appbar, Text
- Element tree: Widget tree와 Render tree를 연결함
- Render tree: 위젯을 그림
- Widget tree 생성 시 Element tree가 만들어지며, Element tree는 위젯의 정보를 가지고 있으며, 링크되어 있어 위젯을 연결한다.
-flutter hotreload: 앱이 빌드될 때 (저장될 떄), 위젯은 리 빌드 된다. 리 빌드된 위젯 트리, 엘리먼트 트리는 리 빌드될 때 이전과 비교하여 바뀐 부분만 재 정의한 뒤 다시 랜더한다.

# final, const
 - const 변수는 컴파일 시 상수화
 - fianl 변수는 런타임 시 상수화 
 - fianl: 앱이 빌드될 때 초기화 되지만 할당은 안 되어 있다. 앱이 실행(런타임)되고 해당 변수에 값이 할당되면 그 변수는 해당 값으로 픽스 된다.
 - const:  컴파일 시에 상수가 됨