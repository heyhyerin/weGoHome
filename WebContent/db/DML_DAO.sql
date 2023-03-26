-- MEMBER ----------------------------------------------------------------------
-- 1. ����� ȸ������
    -- id �ߺ�Ȯ��
    -- public int idConfirm (String mid)
    SELECT * FROM MEMBER WHERE MID = 'aaa';
    
    -- tel �ߺ�Ȯ��
    -- public int telConfirm (String mtel)
    -- SELECT * FROM MEMBER WHERE MTEL = '010-1111-1111';
    SELECT * FROM MEMBER WHERE MTEL = REGEXP_REPLACE('01011111111', '[^0-9]');
    
    -- SELECT REGEXP_REPLACE(MTEL, '[^0-9]') FROM MEMBER;
    
    -- email �ߺ�Ȯ��
    -- public int emailConfirm (String memail)
    SELECT * FROM MEMBER WHERE MEMAIL = 'test1@gmail.com';
    
    -- ȸ������
    -- public int joinMember(MemberDto member)
    INSERT INTO MEMBER (MID, MPW, MNAME, MTEL, MEMAIL, MGENDER, MBIRTH, MADDRESS)
        VALUES ('test3', '111', '�����3' , REGEXP_REPLACE('010-3333-3333','[^0-9]'), 'test3@gmail.com', 'M', 
                '1995/01/01', '����� ��걸');

-- 2. �α���
-- public int loginMember(String mid, String mpw)
SELECT * FROM MEMBER
    WHERE MID = 'test1' AND MPW = '111';

-- ����� ���� ����
    -- 3. ȸ������ ��ȸ
    -- public MemberDto getMember(String mid)
    SELECT * FROM MEMBER WHERE MID = 'test1';
    
    -- 4. ȸ������ ����
    -- public int modifyMember(MemberDto member)
    UPDATE MEMBER SET
            MPW = '111',
            MTEL = REGEXP_REPLACE('010-3333-3333','[^0-9]'),
            MEMAIL = 'test@gmail.com',
            MGENDER = 'M',
            MBIRTH = '1995/01/01',
            MADDRESS = '����� ��걸'
    WHERE MID = 'test1';

-- 5. ȸ�� Ż��
    -- ���ƿ� ��� ����
    DELETE FROM LIKELIST
        WHERE MID = 'bam';
        
    -- �ۼ��� ��� ����
    DELETE FROM ANIMALCOMMENT
        WHERE MID = 'test1';
    
    -- �ۼ��� �ı�Խñ� ����
    DELETE FROM REVIEWBOARD
        WHERE MID = 'test1';
    
    -- public int withDrawalMember(String mpw)
    DELETE FROM MEMBER 
        WHERE MID = 'aaa' AND MPW = '111';

COMMIT;
ROLLBACK;
    
-- SHELTER ---------------------------------------------------------------------
-- 1. �α���
-- public int loginShelter(String sid, String spw)         
SELECT * FROM SHELTER
    WHERE SID = 'SHELTER1' 
      AND SPW = '111';
      
-- 2. ��ȣ�� ���� ����
    -- ��ȣ�� ���� ���
    -- public ShelterDto getShelter(String sid)
    SELECT * FROM SHELTER WHERE SID = 'SHELTER1';
    
    -- ��ȣ�� ���� ����
    -- public int modifyShelter(ShelterDto shelter)
    UPDATE SHELTER SET
            SPW = '111',
            SNAME = '����ø����⵿����ȣ��',
            STEL = '021111111',
            SEMAIL = 'seoul@animal.co.kr',
            SADDRESS = '����� ��걸'
    WHERE SID = 'SHELTER1';

-- ANIMAL ----------------------------------------------------------------------
-- 1. ��ȣ���� ��� ���
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
         
-- 2. ��ϵ� ��ü ���� �� ��ȸ
-- public int getAnimalTotCnt()
SELECT COUNT(*) CNT FROM ANIMAL;    
         
-- 3. ��ȣ���� �ۼ�
-- public int writeAnimal(AnimalDto animal)
INSERT INTO ANIMAL(ANO, SID, APHOTO, ABREED, AGENDER, AAGE, AWEIGHT, ACONTENT,
                   AADDRESS, AADOPT, AIP)
    VALUES (ANIMAL_ANO_SEQ.NEXTVAL, 'SHELTER2', 'NOIMG.jpg', 'Ǫ��', '����(�߼�ȭ O)', 
            '5', '5', '����� �� �����', '�߻긶�� 9����', 'PROTECT', '197.0.0.1');

-- 4. �Խñ� �󼼺���
-- public AnimalDto getAnimal(int ano)
SELECT * FROM ANIMAL 
    WHERE ANO = '4';
    
SELECT A.*,SNAME, STEL, SEMAIL, SADDRESS
    FROM ANIMAL A, SHELTER S
    WHERE A.SID = S.SID AND ANO = 4;
    
-- 5. �Խñ� ����
-- public int modifyAnimal(AnimalDto animal)
UPDATE ANIMAL SET
        APHOTO = 'NOIMG.jpg', 
        ABREED = '��Ƽ��', 
        AGENDER = '����', 
        AAGE = '2', 
        AWEIGHT = '5', 
        ACONTENT = '���� ����', 
        AADDRESS = '��⵵ ���� ���߻꿪 �α�', 
        ARDATE = SYSDATE, 
        AADOPT = 'ADOPT', 
        AIP = '197.0.0.1'
    WHERE ANO = '2';

-- 6. �Խñ� ����
-- public int deleteAnimal(int ano)
DELETE FROM LIKELIST
    WHERE ANO = '2';
    
DELETE FROM ANIMALCOMMENT
    WHERE ANO = '2';

DELETE FROM ANIMAL
    WHERE ANO = '2';

-- 7. ���� �� �˻�
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
              AND SNAME LIKE '%'|| '����' || '%';
      
-- 8. ���� ���ɵ��� ��ȸ(�ֱٿ� ���ƿ��� ������ ����)
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
-- 1. ��� ���
-- public ArrayList<AnimalCommentDto> getCommentList()
SELECT A.* , MNAME
    FROM ANIMALCOMMENT A, MEMBER
    WHERE A.MID = MEMBER.MID AND ANO = '2'
    ORDER BY ACNO DESC;

-- 2. Ư�� �ۿ� ��� �ޱ�
-- public int writeComment (AnimalCommentDto comment)
INSERT INTO ANIMALCOMMENT (ACNO, MID, ANO, ACCONTENT, ACRDATE, ACIP)
    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, 'test1', '2', '���� ���� ������', SYSDATE, '210.0.0.1');
    
-- 3. Ư�� ���Ǳ� ����
-- public int modifyComment (AnimalCommentDto comment)
UPDATE ANIMALCOMMENT SET
        ACCONTENT = '�Ծ� ���Ǵ� ���� �ϸ� �ɱ��?',
        ACRDATE = SYSDATE,
        ACIP = '200.0.0.1'
    WHERE ACNO = '4';
    
-- 4. Ư�� ���Ǳ� ����
-- public int deleteComment (int acno)
DELETE FROM ANIMALCOMMENT
    WHERE ACNO = '4';
    
-- REVIEWBOARD -----------------------------------------------------------------
-- 1-1. �ı�Խ��� �� ���
-- public ArrayList<ReviewBoard> getReviewBoardList
SELECT ROWNUM RN, RBOARD.*
    FROM(SELECT * FROM REVIEWBOARD ORDER BY RGROUP DESC, RSTEP) RBOARD;

SELECT L.*,
        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || 
        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME
        FROM (SELECT ROWNUM RN, RBOARD.*
            FROM(SELECT * FROM REVIEWBOARD ORDER BY RGROUP DESC, RSTEP) RBOARD) L
    WHERE RN BETWEEN 1 AND 10;

-- 1-2. �� �� ���� ����
SELECT COUNT(*) FROM REVIEWBOARD;

-- 2. ����Խ��� �� �ۼ�
INSERT INTO REVIEWBOARD
    (RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)
VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, NULL, 'SHELTER1', '�Ծ� 6���� �ı�', '�Ծ� 6���� ��å�� ���ؿ�',
        '111', NULL, SYSDATE, 0, REVIEWBOARD_RNO_SEQ.CURRVAL, 0, 0, '197.0.0.1');

-- 3. ����Խ��� �� �󼼺���
SELECT L.*,  
        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || 
        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME
    FROM REVIEWBOARD L WHERE RNO = '1';

-- 4. ����Խ��� �� ����
UPDATE REVIEWBOARD SET
    RTITLE = '�Ծ��ı�',
    RCONTENT = '�ı��Դϴ�',
    RPW = '111',
    RPHOTO = 'NOIMG.jpg',
    RRDATE = SYSDATE,
    RIP = '200.0.0.1'
WHERE RNO = '1';

-- 5. ����Խ��� �� ����
DELETE FROM REVIEWBOARD WHERE RNO = '21';

DELETE FROM REVIEWBOARD WHERE RNO = '21' AND RPW='111';

-- 6. ��� �ۼ�
    -- STEP1. �亯�� �ۼ� �� �۾�
    UPDATE REVIEWBOARD SET RSTEP = RSTEP +1
        WHERE RGROUP = 2
            AND RSTEP > 0;
            
    -- STEP 2. �亯�� �ۼ�
    INSERT INTO REVIEWBOARD
        (RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)
    VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, NULL, 'SHELTER1', '�Ծ� 6���� �ı�', '�Ծ� 6���� ��å�� ���ؿ�',
            '111', NULL, SYSDATE, 0, 2, 1, 1, '197.0.0.1');

-- 7. �Խñ� �˻�
SELECT L.*,
        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || 
        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME
        FROM (SELECT ROWNUM RN, RBOARD.*
            FROM(SELECT * FROM REVIEWBOARD 
                 WHERE RTITLE LIKE '%' || '6' || '%'
                 ORDER BY RGROUP DESC, RSTEP) RBOARD) L
    WHERE RN BETWEEN 2 AND 4;

SELECT * FROM REVIEWBOARD
    WHERE RTITLE LIKE '%' || '����' || '%';
    
-- LIKELIST --------------------------------------------------------------------
-- 1. ���ɵ��� ���
INSERT INTO LIKELIST (LNO, MID, ANO)
    VALUES (LIKELIST_LNO_SEQ.NEXTVAL ,'test1', '9');
    
-- 2. ���ɵ��� ����
DELETE FROM LIKELIST
    WHERE ANO = '2';