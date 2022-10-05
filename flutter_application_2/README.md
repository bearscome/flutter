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
