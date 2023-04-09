# Animal Adoption

![animalAdoptionImg-01](https://user-images.githubusercontent.com/119287211/229819951-8e540018-2f13-4512-bbd5-8e786a20b7b9.jpg)



- **프로젝트명**  유기동물 보호관리 시스템 개발
- **인원**  1명
- **기간** 2023.03.20 ~ 2023.03.31
- **DBMS**  Oracle 11g Express Edition
- **언어**  Java SE 8 Platform / HTML5 / CSS / JavaScript
- **디자인패턴**  MVC(Model 2)
- **오픈 Library**  jQuery v3.4.1, jQueryUI

- **프로젝트 소개**

  보호소에서 보호하고 있는 유기동물 정보 조회 및 입양 후기를 공유할 수 있는 유기동물 보호관리 시스템이다.
  
  

## 목차
1. [작업분할 구조도](##작업분할구조도)
2. [Gantt Chart](##GanttChart)
3. [이용자권한](##이용자권한)
4. [Usecase Diagram](##UsecaseDiagram)
5. [Sequence Diagram](##순차다이어그램SequenceDiagram)
6. [기능정의서](##기능정의서)
7. [E-R Diagram](##E-RDiagram)
8. [Project Source Explorer](##ProjectSourceExplorer)
9. [UI시연 및 핵심기능](##UI시연및핵심기능)



## 작업분할 구조도

![animalAdoptionImg-02](https://user-images.githubusercontent.com/119287211/229819978-e7fc4ad9-3fd0-4b95-8101-af95f6548ac8.jpg)



## Gantt Chart

![animalAdoptionImg-03](https://user-images.githubusercontent.com/119287211/229820009-5d8ab7f1-0492-4f46-b842-3f6947fe17eb.jpg)



## 이용자 권한

![animalAdoptionImg-04](https://user-images.githubusercontent.com/119287211/229820037-2cfd7c02-9dd2-49ef-a169-3f42652fda1a.jpg)



## Usecase Diagram

![animalAdoptionImg-05](https://user-images.githubusercontent.com/119287211/229820064-c8b56279-c50a-42ba-ad82-299ccf14b2cc.jpg)



## 순차 다이어그램 Sequence Diagram

#### 사용자모드

![animalAdoptionImg-06](https://user-images.githubusercontent.com/119287211/229820100-4cfe324a-0f22-46ae-9503-d9ba0c87b32b.jpg)

#### 보호소모드

![animalAdoptionImg-07](https://user-images.githubusercontent.com/119287211/229820189-27c22985-dbfe-4b4f-b881-c95af66e449a.jpg)



## 기능정의서

![animalAdoptionImg-08](https://user-images.githubusercontent.com/119287211/229820210-abdf7910-703f-45f0-ab25-6eb7e866c8d9.jpg)



## E-R Diagram

![animalAdoptionImg-09](https://user-images.githubusercontent.com/119287211/229820245-dfd25688-9cdc-465e-871a-869247821955.jpg)



## Project Source Explorer

![animalAdoptionImg-10](https://user-images.githubusercontent.com/119287211/229820273-90d1a85c-9ff4-4c97-94a4-6d1a3417a6f3.jpg)



## UI시연 및 핵심기능

#### 메인 페이지

![animalAdoption-01](https://user-images.githubusercontent.com/119287211/230771581-cad3946a-287d-4550-b59d-e76f7267add0.jpg)

1. 입양하기 / 입양 후기 게시판은 비회원부터 회원 / 보호소까지 모두 조회 가능
2. 로그인 전과 사용자 / 보호소 로그인 후의 메뉴가 각각 다르게 보인다.

![animalAdoption-02](https://user-images.githubusercontent.com/119287211/230771584-e4e0bdc3-1cd4-49f0-aa8c-125bd470406a.jpg)

----



#### 회원가입

![animalAdoption-03](https://user-images.githubusercontent.com/119287211/230771585-0b27ab65-9aba-4c13-94b0-6e2dc9f92145.jpg)

1. 버튼을 클릭하여 ID 중복체크 **Ajax 이용**
2. key up 이벤트를 사용하여 비밀번호 일치 확인 **Ajax 이용**
3. 생년월일 등록 시 달력 출력 **jQuery UI 이용**
4. 회원 가입 완료 시 로그인 페이지로 이동하며 가입한 아이디가 그대로 출력된다.

----


#### 로그인

![animalAdoption-04](https://user-images.githubusercontent.com/119287211/230771587-2a1790e1-b1b7-4d43-b96b-9291e28f2b5e.jpg)

1. 탭을 이용하여 회원과 보호소 로그인 화면 구분
2. 정보 불일치 시 아이디 / 비밀번호 구분 없이 알림 출력

----


#### 사용자: 회원 정보 수정

![animalAdoption-05](https://user-images.githubusercontent.com/119287211/230771589-77513cc3-8669-4a62-b07b-01236fa0b2f3.jpg)

1. 정보 수정 요청 시 현재 비밀번호 확인

2. 새 비밀번호 작성 시 key up 이벤트를 사용하여 비밀번호 일치 확인 **Ajax 사용**

   새 비밀번호와 비밀번호 확인이 일치 시 새 비밀번호로 변경

3. 회원 탈퇴 시 나의 관심동물 / 작성한 게시물 모두 삭제 후 회원 탈퇴 진행

----


#### 사용자: 나의 관심동물

![animalAdoption-06](https://user-images.githubusercontent.com/119287211/230771590-527394e7-71f2-497d-a485-2a6b1cb55f07.jpg)

1. 등록된 관심 동물이 없을 경우 해당 화면 출력
2. 나의 관심 동물은 관심 등록한 순서의 역순으로 정렬
3. 해당 동물 클릭 시 상세보기로 페이지 이동

----


#### 보호소: 보호소 정보 수정

![animalAdoption-17](https://user-images.githubusercontent.com/119287211/230775283-ea1385a4-d219-4bba-9a94-5e400e7ecc8a.jpg)

1. 정보 수정 요청 시 현재 비밀번호 확인

2. 새 비밀번호 작성 시 key up 이벤트를 사용하여 비밀번호 일치 확인 **Ajax 사용**

   새 비밀번호와 비밀번호 확인이 일치 시 새 비밀번호로 변경

----

#### 보호소: 보호 동물 관리 

![animalAdoption-07](https://user-images.githubusercontent.com/119287211/230771592-28f2ae5d-0d33-45f2-8466-3eed5a2ed269.jpg)

1. 해당 보호소가 등록한 총 동물 수 표시
2. 사용자가 관심 추가한 총 관심 수 출력
3. 페이징 처리

----

#### 보호소: 보호 동물 관리

![animalAdoption-08](https://user-images.githubusercontent.com/119287211/230771593-e0f3093a-55f3-4fae-befe-4e0641855c1b.jpg)

1. select를 사용하여 품종 나열
2. 사진 등록을 하지 않은 경우 아래 이미지 출력

<img src="https://user-images.githubusercontent.com/119287211/230771594-26af0c8b-30e4-4525-b434-068e2a798668.jpg" alt="animalAdoption-09" style="zoom:50%;" />



----

#### 입양하기

![animalAdoption-10](https://user-images.githubusercontent.com/119287211/230771596-1b3c5458-7d29-46e0-b654-cf04e50136f8.jpg)

1. 검색하기

   비회원 / 회원 모두 이용 가능

   조건: 축종, 성별, 크기, 보호소 명

2. 관심 동물 추가

   회원만 이용 가능

   비회원이 이용 시 alert창과 함께 로그인 페이지로 이동

<img src="https://user-images.githubusercontent.com/119287211/230771597-58a8d28d-a5ee-42a8-85af-5c5ba54fcffb.jpg" alt="animalAdoption-11" style="zoom: 80%;" />

3. 페이징 처리

----

#### 입양하기: 상세보기

![animalAdoption-12](https://user-images.githubusercontent.com/119287211/230771598-5aa2ca0e-f03d-49e0-b008-38b379b50077.jpg)

1. 탭을 이용하여 상세정보 출력과 문의 사항 부분을 구분
2. 문의 글은 회원만 작성 가능하며, 비로그인 시 작성 버튼 대신 "문의글은 로그인 후 작성할 수 있습니다." 문구 출력


![animalAdoption-13](https://user-images.githubusercontent.com/119287211/230771600-2f4f8d9e-8dda-4651-aaa6-c89b8645f502.jpg)

1. 해당 공고를 작성한 보호소만 답변 글 작성 가능
2. 버튼 클릭 시 답변을 작성할 수 있도록 원글 블럭 변경 **Ajax 이용**
3. 회원 / 보호소는 자신이 작성한 글만 수정 또는 삭제 가능
4. 구분을 위해 답변 글 블럭은 CSS를 다르게 하여 다른 색으로 출력

----


#### 입양 후기 게시판

![animalAdoption-14](https://user-images.githubusercontent.com/119287211/230771602-0a07c1bb-d024-49c4-b4d6-b8c6c8b9a840.jpg)

1. 기본 등록 순 정렬이며, 인기 순으로 정렬 가능
2. 조회 수가 10 이상 시 🌈 무지개 이미지와 함께 인기글 문구 출력
3. 게시글에 첨부가 있을 시 📄 문서 이미지 출력
4. 회원 / 보호소 모두 답글 작성 가능

----


#### 입양 후기 게시판: 상세보기

![animalAdoption-15](https://user-images.githubusercontent.com/119287211/230771606-13b00d97-84d9-4654-ad4b-9dddd28d40f1.jpg)

1. 회원 / 보호소는 자신이 작성한 글만 수정 또는 삭제 가능
2. 작성자와 회원 / 보호소 모두 답변 작성 가능
3. 수정 시 첨부 파일을 올리지 않은 경우 기존에 첨부한 첨부파일 그대로 유지
4. 비밀번호 일치 확인 후 게시글 삭제

----


#### 에러페이지

![animalAdoption-16](https://user-images.githubusercontent.com/119287211/230771608-8e9873fc-e06c-431d-a943-d299aac1e048.jpg)

1. 에러 페이지 처리
2. 에러 발생 시 404 또는 500 에러 페이지로 각각 이동
3. 버튼을 통해 메인 페이지로 이동 가능
