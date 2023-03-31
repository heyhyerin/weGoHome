-- MEMBER ----------------------------------------------------------------------
-- 1. �α���
-- public int loginMember(String mid, String mpw)
SELECT * FROM MEMBER
    WHERE MID = 'test1' AND MPW = '111';

-- 2. ����� ȸ������
    -- id �ߺ�Ȯ��
    -- public int idConfirm (String mid)
    SELECT * FROM MEMBER WHERE MID = 'aaa';
    
    -- tel �ߺ�Ȯ��
    -- public int telConfirm (String mtel)
    -- SELECT * FROM MEMBER WHERE MTEL = '010-1111-1111';
    SELECT * FROM MEMBER WHERE MTEL = REGEXP_REPLACE('01011111111', '[^0-9]');
    
    -- email �ߺ�Ȯ��
    -- public int emailConfirm (String memail)
     -- SELECT REGEXP_REPLACE(MTEL, '[^0-9]') FROM MEMBER;
    SELECT * FROM MEMBER WHERE MEMAIL = 'test1@gmail.com';
    
    -- ȸ������
    -- public int joinMember(MemberDto member)
    INSERT INTO MEMBER (MID, MPW, MNAME, MTEL, MEMAIL, MGENDER, MBIRTH, MADDRESS)
        VALUES ('test3', '111', '�����3' , REGEXP_REPLACE('010-3333-3333','[^0-9]'), 'test3@gmail.com', 'M', 
                '1995/01/01', '����� ��걸');

-- 3. ����� ���� ����
    -- 3-1. ȸ������ ��ȸ
    -- public MemberDto getMember(String mid)
    SELECT * FROM MEMBER WHERE MID = 'test1';
    
    -- 3-2. ȸ������ ����
    -- public int modifyMember(MemberDto member)
    UPDATE MEMBER SET
            MPW = '111',
            MTEL = REGEXP_REPLACE('010-3333-3333', '[^0-9]'),
            MEMAIL = 'test@gmail.com',
            MGENDER = 'M',
            MBIRTH = '1995/01/01',
            MADDRESS = '����� ��걸'
    WHERE MID = 'test1';

-- 4. ȸ�� Ż��
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
    -- 2-1. ��ȣ�� ���� ���
    -- public ShelterDto getShelter(String sid)
    SELECT * FROM SHELTER WHERE SID = 'SHELTER1';
    
    -- 2-2. ��ȣ�� ���� ����
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
    -- 1-1. ����� Ȯ�� ȭ��
    SELECT * FROM(SELECT ROWNUM RN, ANIMALlIST.*
             FROM(SELECT A.*, SNAME, LNO LIKECHK
             FROM ANIMAL A
                , SHELTER S
                ,(SELECT * FROM LIKELIST WHERE MID = '') L
            WHERE A.SID = S.SID
              AND A.ANO = L.ANO(+)
         ORDER BY A.ANO DESC)ANIMALlIST)
            WHERE RN BETWEEN 1 AND 8;

    -- 1-2. ��ϵ� ��ü ���� �� ��ȸ
    -- public int getAnimalTotCnt()
    SELECT COUNT(*) CNT FROM ANIMAL; 
    
    -- 2-1. ��ȣ�� Ȯ�� ȭ��
      SELECT * FROM(SELECT ROWNUM RN, ANIMALLIST.*
               FROM(SELECT A.*, (SELECT COUNT(*) 
               FROM LIKELIST WHERE ANO = A.ANO) LIKECHK
      FROM ANIMAL A
      WHERE SID = 'bshel'
      ORDER BY ARDATE DESC) ANIMALLIST)
      WHERE RN BETWEEN 1 AND 10;  
   
   -- 2-1. ��ȣ�Ұ� ��ȣ���� �� ���� ��
    SELECT COUNT(*) CNT 
      FROM ANIMAL
     WHERE SID = 'bshel';

-- 3. ��ȣ���� �ۼ�
-- public int writeAnimal(AnimalDto animal)
INSERT INTO ANIMAL(ANO, SID, APHOTO, ABREED, AGENDER, AAGE, AWEIGHT, ACONTENT,
                   AADDRESS, AADOPT, AIP)
    VALUES (ANIMAL_ANO_SEQ.NEXTVAL, 'SHELTER2', 'NOIMG.jpg', 'Ǫ��', '����(�߼�ȭ O)', 
            '5', '5', '����� �� �����', '�߻긶�� 9����', 'PROTECT', '197.0.0.1');

-- 4. �Խñ� �󼼺���
-- public AnimalDto getAnimal(int ano)  
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

-- 7-1. ���� �� �˻�
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

-- 7-2. �˻��� �� ���� ��
SELECT COUNT(*) CNT FROM ANIMAL, SHELTER
            WHERE ANIMAL.SID = SHELTER.SID
              AND ABREED LIKE '%' || '' || '%' 
              AND AGENDER LIKE '%'|| '' || '%'
              AND AWEIGHT BETWEEN 0 AND 8
              AND SNAME LIKE '%'|| '����' || '%';
      
-- 8-1. ���� ���ɵ��� ��ȸ(�ֱٿ� ���ƿ��� ������ ����)
-- public ArrayList<AnimalDto> getLikeList(String mid, int startRow, int endRow)
SELECT * FROM(SELECT ROWNUM RN, ANIMALlIST.*
         FROM(SELECT ANIMAL.*, SNAME, LNO LIKECHK
            FROM ANIMAL, SHELTER, LIKELIST
            WHERE ANIMAL.SID = SHELTER.SID
              AND LIKELIST.ANO = ANIMAL.ANO
              AND LIKELIST.MID = 'aaaa'
            ORDER BY LNO)ANIMALlIST)
         WHERE RN BETWEEN 1 AND 8;

-- 8-2. ���� ���ɵ��� �� ��
SELECT COUNT(*) CNT
  FROM ANIMAL, LIKELIST
 WHERE ANIMAL.ANO = LIKELIST.ANO
   AND LIKELIST.MID = 'aaaa';
   
-- ANIMALCOMMENT ---------------------------------------------------------------
-- 1. ��� ���
-- public ArrayList<AnimalCommentDto> getCommentList()
SELECT AC.*,
  (SELECT MNAME FROM MEMBER WHERE AC.MID = MID) ||
  (SELECT SNAME FROM SHELTER WHERE AC.SID = SID) WRITERNAME
   FROM ANIMALCOMMENT AC
   WHERE AC.ANO = '2'
   ORDER BY ACGROUP DESC, ACSTEP;

-- 2. Ư�� �ۿ� ��� �ޱ�
-- public int writeComment (AnimalCommentDto comment)
INSERT INTO ANIMALCOMMENT (ACNO, ANO, MID, SID, ACCONTENT, ACRDATE, ACGROUP, ACSTEP, ACIP)
    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, '2', 'amem', NULL, 
           '���� ���� ������', SYSDATE, ANIMALCOMMENT_ACNO_SEQ.CURRVAL , 0, '210.0.0.1');

-- 3-1. Ư�� ���Ǳ� ���� Ȯ��
SELECT AC.*,
    (SELECT MNAME FROM MEMBER WHERE AC.MID = MID) ||
    (SELECT SNAME FROM SHELTER WHERE AC.SID = SID) WRITERNAME
    FROM ANIMALCOMMENT AC
    WHERE ACNO = '1';

-- 3-2. Ư�� ���Ǳ� ����
-- public int modifyComment (AnimalCommentDto comment)
UPDATE ANIMALCOMMENT SET
        ACCONTENT = '�Ծ� ���Ǵ� ���� �ϸ� �ɱ��?',
        ACIP = '200.0.0.1'
    WHERE ACNO = '4';
    
-- 4. Ư�� ���Ǳ� ����
-- public int deleteComment (int acno)
DELETE FROM ANIMALCOMMENT
    WHERE ACNO = '3';

-- 5. Ư�� ��ۿ� ���
-- 5-1. ��� �ۼ� �� STEP +1
UPDATE ANIMALCOMMENT SET ACSTEP = ACSTEP +1
    WHERE ACGROUP = 1
      AND ACSTEP > 0;


-- 5-2. ��� ��� �ۼ�
INSERT INTO ANIMALCOMMENT (ACNO, ANO, MID, SID, ACCONTENT, ACRDATE, ACGROUP, ACSTEP, ACIP)
    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, '2', NULL, 'ashel', 
           '�亯�帳�ϴ�.', SYSDATE, 1, 1, '210.0.0.1');

-- REVIEWBOARD -----------------------------------------------------------------
-- 1. �ı�Խ��� �� ���
-- 1-1. ��� �� ����
-- public ArrayList<ReviewBoard> getReviewBoardList
SELECT L.*,
        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || 
        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME
        FROM (SELECT ROWNUM RN, RBOARD.*
            FROM(SELECT * FROM REVIEWBOARD 
            ORDER BY RGROUP DESC, RSTEP) RBOARD) L
    WHERE RN BETWEEN 1 AND 10;

-- 1-2. �α� �� ����
SELECT L.*,
        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || 
        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME
        FROM (SELECT ROWNUM RN, RBOARD.*
            FROM(SELECT * FROM REVIEWBOARD 
            ORDER BY RHIT DESC,RGROUP DESC, RSTEP) RBOARD) L
    WHERE RN BETWEEN 1 AND 10;

-- 1-3. �� �� ���� ����
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
    WHERE MID = 'aaaa' AND ANO = '19';
    