# Scaffold
appBar: AppBar(
    title: const Text('하이'), // 상단 타이틀
    
    centerTitle: true // 중앙 위치,
    
    // leading: IconButton( // 왼쪽 버튼
    //   icon: Icon(Icons.menu),
    //   onPressed: () => print('hi'),
    // ),
    // 
    actions: [ // 오른쪽 버튼 들
        IconButton(
            icon: Icon(Icons.mail),
            onPressed: () => print('안녕'),
        )
    ],
)

 drawer: Drawer( // 왼쪽 버튼 마이 상세보기 같은 기능 
    child: ListView(
        children: [
        UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                // backgroundImage: AssetImage(''),
                ),
            accountName: Text('accountName'),
            accountEmail: Text('accountEmail'),
            onDetailsPressed: () => print('하이'),
            otherAccountsPictures: [
            CircleAvatar(
                backgroundColor: Colors.red,
            ),
            ],
        ),
        ListTile(
            leading: Icon(Icons.media_bluetooth_off),
            title: Text('home'),
            onTap: () => print('hi'),
            trailing: Icon(Icons.add),
        ),
        ],
    ),
),

# BuildContext
 - widget tree에서 현재 widget의 위치를 알 수 있는 정보
 - context 인자 값을 통해 widget을 리턴함

# scaffold.of(context) 
 - of메소드는 현재 자신에서 부모까지 제일 가까운 scaffold를 찾는 메소드 이다.
 - Theme.of(context): 현재 자신에서 부모까지 제일 가까운 Theme를 찾는다.
 - scaffold.of(context)를 사용할 때 buildcontex기준으로 찾는데, 현재 위젯의 부모가 scaffold가 없다면, Builder함수를 선언하여 현재 위젯에서 Builder하여 상위 widget에 있는 scaffold를 참조 할 수 있다.

# Router
 - Scaffold는 하나의 페이지(위젯이다)임으로 모든 라우터에서 사용이 가능하다.
 - 라우터 기능은 Stack기능이다.
 - Navigaotr함수를 사용한다
    -- push(context, route)
        --- context는 위젯 트리의 위치정보를 근거하여 현재 화면상의 보여지는 페이지가 어떤페이지인지 확인하고 push함수가 이동하기 원하는 페이지를 쌓기 위함, Second Page를 쌓기위해 first Page의 정확한 위치를 알아야 하기 때문이다.
        --- route는 이동할 페이지, MaterialPageRoute(builder:)
            /// buulder는 reqiuer arg이다. 

# Listview vs ListView.builder
 - 공통점
    -- 스크롤이 가능한 배열형 위젯
 - 차이점
    -- ListView: 리스트뷰 안에 모든 차일드를 생성해서 보여줌
    -- ListView.builder: 그때 그때 필요한 만큼만 데이터를 저장소나 서버에서 불러옴

# MediaQuery.of(context).size.width * 0.7
 - 디바이스의 크기를 가져와서 width를 정할 수 있다.