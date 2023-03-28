# startoup

1. 해당 프로젝트에는 셀레니움을 통한 동적 크롤링이 포함되어 있습니다. 해당 기능 사용을 위해
크롬을 최신 버전으로 업데이트 후 해당 버전과 운영체제에 맞는 ChromDrvier를 설치해주셔야합니다.

Java Resources의 com.startoup.biz.crawling 패키지에 DriverUtil 클래스로 이동하여
드라이버의 경로를 지정해주면 사용할 수 있습니다. (주석 참고)

2. 해당 프로젝트는 Oracle 데이터베이스를 사용하고 있습니다.
Java Resources의 com.startoup.biz.common 패키지에 JDBCUtil 클래스로 이동하여
본인의 오라클 계정과 비밀번호 입력이 필요합니다.

3. 해당 프로젝트는 로컬 환경을 기반으로 작업되었으며 톰캣 아파치를 사용하고 있습니다.

4. 서버 실행 또는 제대로 된 실행이 되지 않는다면 Maven Update를 시도 후 실행하기를 권장드립니다.
