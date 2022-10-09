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
 - fianl 변수는 런타임 시 상수화 
 - fianl: 앱이 빌드될 때 초기화 되지만 할당은 안 되어 있다. 앱이 실행(런타임)되고 해당 변수에 값이 할당되면 그 변수는 해당 값으로 픽스 된다.
 - const:  컴파일 시에 상수가 됨

# _(UnderScope)
 - 생성자에서 생성할 때, 언더스코프가 선언된게 있으면 숨김처리가 되어 생성자에서 해당 클래스를 생성해도 접근이 불가하다.

# sigle Thread
 - 다트는 싱글쓰레드이다.
 - FIFO(선입선출)방식으로 "마이크로테스크"와 "이벤트" 준비
 - main 함수 실행
 - Event loop 실행
 - 자바스크립트랑 비슷하당..

 # Future
 1. 다트에 의해서 Future 객체가 내부적인 배열에 등록
 2. Future관련해서 실행되어야 하는 코드들이 이벤트 큐에 등록
 3. 불완전한 future객체가 반환
 4. Synchronous 방식으로 실행되어야 할 코드 먼저 실행
 5. 최종적으로 실제적인 data값이 future 객체로 전달

 # Async method
 1. 메세드를 통해서 나오는 결과물은 future // 이거 자바스크립트 async함수가 Promise로 변경되는 것이랑 똑같아 보이는데???
 2. Await 키워드를 만날 때까지 synchronuous방식으로 코드 처리
 3. Await 키워들르 만나면 future가 완료될 때까지 대기
 4. future가 완료되자마자 그 다음 코드를 실행
 5. Future에 await가 없으면, 동기 처리가 다 된 후 비동기 처리가 된다.

 # Null safety
 1. Null: 빈 값 
 2. 모든 변수는 null이 될 수 없으며. non-nullalble 변수에는 null 값을 할당할 수 없다.
 3. Class 내의 변수는 단드시 선언과 동시에 초기화를 시켜야 한다.