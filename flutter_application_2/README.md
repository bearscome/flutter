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