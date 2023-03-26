-- MEMBER ----------------------------------------------------------------------
-- 1. 사용자 회원가입
    -- id 중복확인
    -- public int idConfirm (String mid)
    SELECT * FROM MEMBER WHERE MID = 'aaa';
    
    -- tel 중복확인
    -- public int telConfirm (String mtel)
    -- SELECT * FROM MEMBER WHERE MTEL = '010-1111-1111';
    SELECT * FROM MEMBER WHERE MTEL = REGEXP_REPLACE('01011111111', '[^0-9]');
    
    -- SELECT REGEXP_REPLACE(MTEL, '[^0-9]') FROM MEMBER;
    
    -- email 중복확인
    -- public int emailConfirm (String memail)
    SELECT * FROM MEMBER WHERE MEMAIL = 'test1@gmail.com';
    
    -- 회원가입
    -- public int joinMember(MemberDto member)
    INSERT INTO MEMBER (MID, MPW, MNAME, MTEL, MEMAIL, MGENDER, MBIRTH, MADDRESS)
        VALUES ('test3', '111', '사용자3' , REGEXP_REPLACE('010-3333-3333','[^0-9]'), 'test3@gmail.com', 'M', 
                '1995/01/01', '서울시 용산구');

-- 2. 로그인
-- public int loginMember(String mid, String mpw)
SELECT * FROM MEMBER
    WHERE MID = 'test1' AND MPW = '111';

-- 사용자 정보 수정
    -- 3. 회원정보 조회
    -- public MemberDto getMember(String mid)
    SELECT * FROM MEMBER WHERE MID = 'test1';
    
    -- 4. 회원정보 수정
    -- public int modifyMember(MemberDto member)
    UPDATE MEMBER SET
            MPW = '111',
            MTEL = REGEXP_REPLACE('010-3333-3333','[^0-9]'),
            MEMAIL = 'test@gmail.com',
            MGENDER = 'M',
            MBIRTH = '1995/01/01',
            MADDRESS = '서울시 용산구'
    WHERE MID = 'test1';

-- 5. 회원 탈퇴
    -- 좋아요 목록 삭제
    DELETE FROM LIKELIST
        WHERE MID = 'bam';
        
    -- 작성한 댓글 삭제
    DELETE FROM ANIMALCOMMENT
        WHERE MID = 'test1';
    
    -- 작성한 후기게시글 삭제
    DELETE FROM REVIEWBOARD
        WHERE MID = 'test1';
    
    -- public int withDrawalMember(String mpw)
    DELETE FROM MEMBER 
        WHERE MID = 'aaa' AND MPW = '111';

COMMIT;
ROLLBACK;
    
-- SHELTER ---------------------------------------------------------------------
-- 1. 로그인
-- public int loginShelter(String sid, String spw)         
SELECT * FROM SHELTER
    WHERE SID = 'SHELTER1' 
      AND SPW = '111';
      
-- 2. 보호소 정보 수정
    -- 보호소 정보 출력
    -- public ShelterDto getShelter(String sid)
    SELECT * FROM SHELTER WHERE SID = 'SHELTER1';
    
    -- 보호소 정보 수정
    -- public int modifyShelter(ShelterDto shelter)
    UPDATE SHELTER SET
            SPW = '111',
            SNAME = '서울시립유기동물보호소',
            STEL = '021111111',
            SEMAIL = 'seoul@animal.co.kr',
            SADDRESS = '서울시 용산구'
    WHERE SID = 'SHELTER1';

-- ANIMAL ----------------------------------------------------------------------
-- 1. 보호동물 목록 출력
-- public ArrayList<AnimalDto> getAnimalList(int startRow, int endRow)
-- SELECT ANIMAL.*, SHELTER.SNAME FROM ANIMAL, SHELTER
--    WHERE ANIMAL.SID = SHELTER.SID
--    ORDER BY ARDATE DESC;
--    
-- SELECT ROWNUM RN, ANIMALlIST.*
--    FROM(SELECT ANIMAL.*, SHELTER.SNAME FROM ANIMAL, SHELTER
--    WHERE ANIMAL.SID = SHELTER.SID
--    ORDER BY ARDATE DESC)ANIMALlIST;

SELECT * FROM(SELECT ROWNUM RN, ANIMALlIST.*
         FROM(SELECT ANIMAL.*, SNAME 
            FROM ANIMAL, SHELTER
            WHERE ANIMAL.SID = SHELTER.SID
            ORDER BY ARDATE DESC)ANIMALlIST)
         WHERE RN BETWEEN 1 AND 2;
         
-- 2. 등록된 전체 동물 수 조회
-- public int getAnimalTotCnt()
SELECT COUNT(*) CNT FROM ANIMAL;    
         
-- 3. 보호공고 작성
-- public int writeAnimal(AnimalDto animal)
INSERT INTO ANIMAL(ANO, SID, APHOTO, ABREED, AGENDER, AAGE, AWEIGHT, ACONTENT,
                   AADDRESS, AADOPT, AIP)
    VALUES (ANIMAL_ANO_SEQ.NEXTVAL, 'SHELTER2', 'NOIMG.jpg', '푸들', '암컷(중성화 O)', 
            '5', '5', '사람을 잘 따라요', '중산마을 9단지', 'PROTECT', '197.0.0.1');

-- 4. 게시글 상세보기
-- public AnimalDto getAnimal(int ano)
SELECT * FROM ANIMAL 
    WHERE ANO = '4';
    
SELECT A.*,SNAME, STEL, SEMAIL, SADDRESS
    FROM ANIMAL A, SHELTER S
    WHERE A.SID = S.SID AND ANO = 4;
    
-- 5. 게시글 수정
-- public int modifyAnimal(AnimalDto animal)
UPDATE ANIMAL SET
        APHOTO = 'NOIMG.jpg', 
        ABREED = '말티즈', 
        AGENDER = '수컷', 
        AAGE = '2', 
        AWEIGHT = '5', 
        ACONTENT = '겁이 많음', 
        AADDRESS = '경기도 고양시 정발산역 부근', 
        ARDATE = SYSDATE, 
        AADOPT = 'ADOPT', 
        AIP = '197.0.0.1'
    WHERE ANO = '2';

-- 6. 게시글 삭제
-- public int deleteAnimal(int ano)
DELETE FROM LIKELIST
    WHERE ANO = '2';
    
DELETE FROM ANIMALCOMMENT
    WHERE ANO = '2';

DELETE FROM ANIMAL
    WHERE ANO = '2';

-- 7. 동물 상세 검색
-- public ArrayList<AnimalDto> searchAnimal(String abreed, String agender, int aweight)
SELECT * FROM(SELECT ROWNUM RN, ANIMALlIST.*
         FROM(SELECT ANIMAL.*, SNAME 
            FROM ANIMAL, SHELTER
            WHERE ANIMAL.SID = SHELTER.SID
              AND ABREED LIKE '%' || '' || '%' 
              AND AGENDER LIKE '%'|| '' || '%'
              AND AWEIGHT BETWEEN 0 AND 8
              AND SNAME LIKE '%'|| '' || '%'
            ORDER BY ARDATE DESC)ANIMALlIST)
         WHERE RN BETWEEN 1 AND 100;
         
SELECT COUNT(*) CNT FROM ANIMAL, SHELTER
            WHERE ANIMAL.SID = SHELTER.SID
              AND ABREED LIKE '%' || '' || '%' 
              AND AGENDER LIKE '%'|| '' || '%'
              AND AWEIGHT BETWEEN 0 AND 8
              AND SNAME LIKE '%'|| '서울' || '%';
      
-- 8. 나의 관심동물 조회(최근에 좋아요한 순서로 정렬)
-- public ArrayList<AnimalDto> getLikeList(String mid, int startRow, int endRow)
SELECT * FROM(SELECT ROWNUM RN, ANIMALlIST.*
         FROM(SELECT ANIMAL.*, SNAME 
            FROM ANIMAL, SHELTER, LIKELIST
            WHERE ANIMAL.SID = SHELTER.SID
              AND LIKELIST.ANO = ANIMAL.ANO
              AND LIKELIST.MID = 'test1'
            ORDER BY LNO DESC)ANIMALlIST)
         WHERE RN BETWEEN 1 AND 10;
    
-- ANIMALCOMMENT ---------------------------------------------------------------
-- 1. 댓글 출력
-- public ArrayList<AnimalCommentDto> getCommentList()
SELECT A.* , MNAME
    FROM ANIMALCOMMENT A, MEMBER
    WHERE A.MID = MEMBER.MID AND ANO = '2'
    ORDER BY ACNO DESC;

-- 2. 특정 글에 댓글 달기
-- public int writeComment (AnimalCommentDto comment)
INSERT INTO ANIMALCOMMENT (ACNO, MID, ANO, ACCONTENT, ACRDATE, ACIP)
    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, 'test1', '2', '좋은 주인 만나렴', SYSDATE, '210.0.0.1');
    
-- 3. 특정 문의글 수정
-- public int modifyComment (AnimalCommentDto comment)
UPDATE ANIMALCOMMENT SET
        ACCONTENT = '입양 문의는 어디로 하면 될까요?',
        ACRDATE = SYSDATE,
        ACIP = '200.0.0.1'
    WHERE ACNO = '4';
    
-- 4. 특정 문의글 삭제
-- public int deleteComment (int acno)
DELETE FROM ANIMALCOMMENT
    WHERE ACNO = '4';
    
-- REVIEWBOARD -----------------------------------------------------------------
-- 1-1. 후기게시판 글 목록
-- public ArrayList<ReviewBoard> getReviewBoardList
SELECT ROWNUM RN, RBOARD.*
    FROM(SELECT * FROM REVIEWBOARD ORDER BY RGROUP DESC, RSTEP) RBOARD;

SELECT L.*,
        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || 
        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME
        FROM (SELECT ROWNUM RN, RBOARD.*
            FROM(SELECT * FROM REVIEWBOARD ORDER BY RGROUP DESC, RSTEP) RBOARD) L
    WHERE RN BETWEEN 1 AND 10;

-- 1-2. 총 글 갯수 저장
SELECT COUNT(*) FROM REVIEWBOARD;

-- 2. 리뷰게시판 글 작성
INSERT INTO REVIEWBOARD
    (RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)
VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, NULL, 'SHELTER1', '입양 6주차 후기', '입양 6주차 산책도 잘해요',
        '111', NULL, SYSDATE, 0, REVIEWBOARD_RNO_SEQ.CURRVAL, 0, 0, '197.0.0.1');

-- 3. 리뷰게시판 글 상세보기
SELECT L.*,  
        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || 
        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME
    FROM REVIEWBOARD L WHERE RNO = '1';

-- 4. 리뷰게시판 글 수정
UPDATE REVIEWBOARD SET
    RTITLE = '입양후기',
    RCONTENT = '후기입니다',
    RPW = '111',
    RPHOTO = 'NOIMG.jpg',
    RRDATE = SYSDATE,
    RIP = '200.0.0.1'
WHERE RNO = '1';

-- 5. 리뷰게시판 글 삭제
DELETE FROM REVIEWBOARD WHERE RNO = '21';

DELETE FROM REVIEWBOARD WHERE RNO = '21' AND RPW='111';

-- 6. 답글 작성
    -- STEP1. 답변글 작성 전 작업
    UPDATE REVIEWBOARD SET RSTEP = RSTEP +1
        WHERE RGROUP = 2
            AND RSTEP > 0;
            
    -- STEP 2. 답변글 작성
    INSERT INTO REVIEWBOARD
        (RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)
    VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, NULL, 'SHELTER1', '입양 6주차 후기', '입양 6주차 산책도 잘해요',
            '111', NULL, SYSDATE, 0, 2, 1, 1, '197.0.0.1');

-- 7. 게시글 검색
SELECT L.*,
        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || 
        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME
        FROM (SELECT ROWNUM RN, RBOARD.*
            FROM(SELECT * FROM REVIEWBOARD 
                 WHERE RTITLE LIKE '%' || '6' || '%'
                 ORDER BY RGROUP DESC, RSTEP) RBOARD) L
    WHERE RN BETWEEN 2 AND 4;

SELECT * FROM REVIEWBOARD
    WHERE RTITLE LIKE '%' || '주차' || '%';
    
-- LIKELIST --------------------------------------------------------------------
-- 1. 관심동물 등록
INSERT INTO LIKELIST (LNO, MID, ANO)
    VALUES (LIKELIST_LNO_SEQ.NEXTVAL ,'test1', '9');
    
-- 2. 관심동물 해제
DELETE FROM LIKELIST
    WHERE ANO = '2';