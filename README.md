# baseball
그룹프로젝트 #3

# 기획

<p align="center">
<img width="300" alt="1" src="https://user-images.githubusercontent.com/45817559/117403396-0f579600-af43-11eb-889d-d6de72f47ebe.png">
<img width="300" alt="2" src="https://user-images.githubusercontent.com/45817559/117403416-17afd100-af43-11eb-833c-da3d68a9aeb3.png">
</p>

- 게임 룰은 실제 야구 게임의 규칙을 토대로 한다.
- 변경사항이 있다면 게임에서는 1루타만 존재한다.
- 공격과 수비가 비동기적으로 동작한다.
- 지명타자 없이 투수가 타격을 한다.

## 백로그
- iOS: https://github.com/PizzaCola-K/baseball/projects/2
- BE: https://github.com/PizzaCola-K/baseball/projects/3

## 회의 
회의 일정은 매일 오후 2시~3시로 한다.

회의의 주제는 iOS에서 나눈 작업단위로 진행합니다.

https://github.com/PizzaCola-K/baseball/wiki/%5BiOS%5D-%EC%9E%91%EC%97%85-%EB%8B%A8%EC%9C%84-%EB%85%BC%EC%9D%98

## 팀소개
- iOS
  - ZG 🏋️‍♂️
  - BMO 🐷🐖
- Backend
  - K 🍕🥤

## 브랜치 전략


<img width="900" alt="5" src="https://user-images.githubusercontent.com/64049682/117411667-ca396100-af4e-11eb-88c1-82d57f01b883.png">

- 최상위에 iOS와 BE 폴더를 만든다.
- main 브랜치는 배포용
- 주 개발 브랜치는 dev/iOS , dev/BE가 된다. 배포할 시점이 되면, dev 브랜치를 main으로 PR을 보내서 배포를 한다.
- 기능 추가는 dev 브랜치에서, {기능-이름} 형식으로 추가 브랜치를 만들고, dev 브랜치로 PR을 보낸다.
- 외부 리뷰용 브랜치로 review/iOS, review/BE 브랜치를 dev 에서 만들고, upstream/team-7로 PR을 보내 리뷰를 받는다.
- 리뷰와 관련하여 받은 피드백은 review에 추가한 후, dev 브랜치를 review 브랜치로 rebase 한다.

## 커밋 컨벤션

```
# <type>: <Title>

##################################################


# 본문은 위에 작성
########################################################################

# 꼬릿말은 아래에 작성: ex) #이슈 번호
issue:
# --- COMMIT END ---
# <타입> 리스트
#   feat    : 기능 (새로운 기능)
#   fix     : 버그 (버그 수정)
#   refactor: 리팩토링
#   style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
#   docs    : 문서 (문서 추가, 수정, 삭제)
#   test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
#   chore   : 기타 변경사항 (빌드 스크립트 수정 등)
# ------------------
#     제목 첫 글자를 대문자로
#     제목은 명령문으로
#     제목 끝에 마침표(.) 금지
#     제목과 본문을 한 줄 띄워 분리하기
#     본문은 "어떻게" 보다 "무엇을", "왜"를 설명한다.
#     본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
# ------------------

```

## 진행상황

- [iOS] :
<p align="left">
<img width="300" alt="3" src="https://user-images.githubusercontent.com/64049682/117406154-a3c3f780-af47-11eb-9a5d-ed605a2a06a7.png">
<img width="300" alt="4" src="https://user-images.githubusercontent.com/64049682/117405952-5fd0f280-af47-11eb-8856-37e3cf87c547.png">
</p>

- [BE] :
  - 팀에서 API 논의
  - 논의한 API에 맞춰 정보를 담을 객체 설계 (BaseballGame, Team)
  - 객체의 내용을 DB에 저장할 수 있도록 Spring Data jdbc에 맞춰 DB schema 설계

