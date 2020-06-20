-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: someproject
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bbs`
--

DROP TABLE IF EXISTS `bbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(100) DEFAULT NULL,
  `star` varchar(100) DEFAULT NULL,
  `content` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `service` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `bbs_fk` (`id`),
  CONSTRAINT `bbs_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs`
--

LOCK TABLES `bbs` WRITE;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
INSERT INTO `bbs` VALUES (4,'9a','5','ㅋㅋㅋㅋㅋㅋ','2020-04-08 01:12:10','내 마음을 풀어줘'),(5,'dddds2','4','좋아요','2020-04-08 01:16:13','I.Need.Some'),(6,'Gahh','3','재밌어요 진짜','2020-04-08 01:16:20','내 마음을 풀어줘'),(7,'ehdgusd','5','너무좋다','2020-04-08 01:16:24','내 마음을 풀어줘'),(8,'9a','5','이거 대박날것 같아요','2020-04-08 01:16:32','내 마음을 풀어줘'),(9,'chaey9671','5','이거 진짜 여태 써본것중에 최고...','2020-04-08 01:16:43','내 마음을 풀어줘'),(10,'9a','4','너무 좋은거 같아요 ㅠㅠㅠㅠ','2020-04-08 01:16:50','내 마음을 풀어줘'),(11,'dddds2','4','진짜 이거 미췬거아냐?!','2020-04-08 01:16:58','I.Need.Some'),(12,'9a','4','무료라서 더좋아요 ㅠㅠㅠㅠ','2020-04-08 01:17:06','내 마음을 풀어줘'),(13,'9a','5','돈 쓸 가치가 있네염!','2020-04-08 01:17:17','I.Need.Some'),(14,'chaey9671','5','작성완료!','2020-04-08 03:58:53','내 마음을 풀어줘'),(15,'9a','5','진짜 너무 행복함.','2020-04-08 05:33:15','내 마음을 풀어줘'),(16,'9a','5','대박이야','2020-04-08 05:35:24','내 마음을 풀어줘'),(17,'dddds2','4','더 대박','2020-04-08 05:35:44','내 마음을 풀어줘'),(18,'9a','5','상도씨 화이팅','2020-04-08 05:41:25','내 마음을 풀어줘'),(19,'dddds2','5','호재씨 화이팅','2020-04-08 09:20:11','내 마음을 풀어줘'),(20,'Gahh','5','조아요오','2020-04-22 05:09:56','내 마음을 풀어줘'),(21,'9a','5','우왕','2020-04-22 05:10:41','I.Need.Some'),(22,'dddds2','5','이거 너무 재밌어요 ㅠㅠ','2020-04-22 05:41:53','I.Need.Some');
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makequest`
--

DROP TABLE IF EXISTS `makequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `makequest` (
  `category` varchar(100) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL,
  `answer1` varchar(100) DEFAULT NULL,
  `answer2` varchar(100) DEFAULT NULL,
  `answer3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makequest`
--

LOCK TABLES `makequest` WRITE;
/*!40000 ALTER TABLE `makequest` DISABLE KEYS */;
INSERT INTO `makequest` VALUES ('상황','애인이 폰을 보고 싶어할 때','너도 폰 줘봐, 조건부로 공개','서로의 신뢰를 위해 당당하게 공개','이건 프라이버시잖아, 절대 비공개'),('상황','애인이 몸이 아플 때','푹 쉴 수 있게 냅둬주기 ','약 사들고 집 앞에 센스있게 두고오기','잘 먹어야 낫는다! 정성껏 죽 끓여주기'),('상황','애인이 삐졌을 때','애교를 시전하여 풀어준다','집 앞에 찾아가 깜작 이벤트를 해준다','저기압일땐 고기앞으로 데려간다'),('상황','애인이 울 때','더 울게 조용히 안아준다','눈물 닦아주며 울지말라고 한다','웃게 만들어 준다'),('상황','찬바람 쌩쌩 부는 어느 추운 겨울날','목도리를 벗어서 칭칭 둘러주기','따뜻한 캔커피를 사와 주머니에 스르륵','장갑 한쪽씩 나눠끼고 손 꼭 잡아주기'),('연애','애인의 과거! 난 이렇게 한다','직접 물어본다','과거는 과거일뿐 신경쓰지 않는다','몰래 알아낸다'),('연애','연인과의 다툼에서 나는 어떤 스타일?','즉시 대화로 해결한다','생각할 시간을 갖고 이야기한다','안 싸운다! 나는 평화주의자!'),('연애','하루에 연락은 얼마나?','잦은 톡보다는 전화가 좋아요','틈틈이 톡해주는게 좋아요','만났을 때 충실하고 싶어요'),('연애','나의 연애 성향은?','주도권을 가지고 리드하는 스타일','맞춰주고 배려를 아끼지 않는 스타일','자유와 평등에 맞추는 스타일'),('연애','내가 원하는 데이트 빈도는?','주 1회','주 2~3회','매일매일 보고싶어요'),('취향','좋아하는 영화 취향','긴장감 있는 반전 스릴러','볼거리가 많은 액션 판타지','달달한 로맨틱 코메디'),('취향','좋아하는 음악 스타일','감미롭고 서정적인 발라드','어깨 춤이 절로나는 댄스, 락','일렉트로닉, 힙합 비트'),('취향','나는 OO 취향이 맞는것에 가장 끌려요','음식/기호식품 취향','영화/음악/스포츠 등의 문화 취향','쿵짝! 대화코드'),('취향','이성의 어떤 향기에 끌리나요?','옷에서 풍기는 섬유유연제 향기','체취와 섞여 매력적인 향수 향기','머리카락에서 풍기는 샴푸향기'),('취향','카페에서 어떤 음료를 즐기나요?','쌉쌀한 맛이 일품인 아메리카노','달달한 라떼, 모카, 마끼야또 등','주스, 에이드, 차'),('활동','관심있는 동호회 모임은?','레저/스포츠','독서/봉사활동','스터디/자기계발'),('활동','운동을 얼마나 하세요?','only 숨쉬기 운동','일주일에 1~2회','매일 규칙적으로'),('활동','내가 활동하기 좋아하는 시간은?','일찍 일어나는게 더 쉬운 아침형','늦게 자는게 더  쉬운 저녁형','엔돌핀이 분비되는 오후형'),('활동','내가 가장 좋아하는 주말 보내기는?','뒹굴 뒹굴 집에서 푹 쉴래','맛집탐방하러 고고','액티브한 스포츠 활동'),('활동','여행지에서 나는 어떤 스타일?','아침 일찍 기상하여 계획대로형','먹고 마시는 릴렉스형','스포츠를 즐기는 액티브형');
/*!40000 ALTER TABLE `makequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `loc` varchar(100) NOT NULL,
  `blood` varchar(100) NOT NULL,
  `tall` int(11) NOT NULL,
  `reli` varchar(100) NOT NULL,
  `drink` int(11) NOT NULL,
  `smoke` int(11) NOT NULL,
  `mbtitype` varchar(100) DEFAULT NULL,
  `tel` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sc` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('123abc','1281','123abc',25,'여성','서울','A',158,'기독교',4,2,'INFP','010-4519-6446','r2@naver.com',3),('192160h','1298','전현정',25,'여성','서울','B',155,'기독교',4,2,'ENTJ','010-4440-4696','zxcv@naver.com',0),('2n','1277','날',25,'여성','서울','A',162,'무교',4,1,'INFP','010-1477-7167','96dlskfk@naver.com',0),('9a','1275','1희',26,'여성','서울','O',168,'무교',3,2,'INTP','010-5510-5647','mondu95@nate.com',3),('abssjd15','1299','유니',24,'여성','서울','AB',164,'무교',2,2,'ESTP','010-1672-2693','cleo97@naver.com',0),('alfk00200','1308','정민욱',24,'남성','강원','B',183,'무교',4,2,'INFJ','010-5603-1630','alfk00100@naver.com',0),('asdf0331','1288','재선',25,'여성','서울','A',164,'무교',5,1,'ENTJ','010-6172-7931','asdf@naver.com',0),('bigmama','1254','칠공팔',29,'남성','경기','O',173,'무교',3,2,'ISTP','010-9246-6330','a8@naver.com',0),('BLB19','1279','김더덕무침',26,'남성','서울','AB',177,'무교',4,2,'INFP','010-2626-7305','a24@naver.com',0),('chaey9671','1266','김채연',26,'여성','경기','AB',160,'기독교',4,2,'INFJ','010-4609-9074','a18@naver.com',0),('Choi8','1284','최준석',33,'남성','서울','A',170,'무교',3,2,'ENTJ','010-3004-9326','weae@naver.com',0),('dddds2','1261','귀욤이',23,'여성','인천','O',155,'무교',3,2,'ENFJ','010-1873-3703','a14@naver.com',3),('dkdhsbsj','1234','김가연',25,'여성','서울','A',164,'무교',4,2,'INFP','010-7493-4144','a1@naver.com',0),('edu','1251','에듀',32,'남성','서울','B',170,'무교',2,2,'ENTJ','010-4488-6214','a7@naver.com',0),('educamp2016','1271','에캠짱',26,'남성','서울','A',183,'기독교',4,2,'ESFP','010-8557-4919','a21@naver.com',0),('ehdgusd','1287','김동현',24,'남성','서울','AB',170,'무교',4,1,'ESTP','010-1306-4131','asdf@naver.com',0),('ehfapddl95','1262','mjcho',26,'남성','경기','O',179,'무교',2,2,'ENTP','010-3490-9902','ehfapddl95@naver.com',0),('fun468','1291','솜',23,'여성','경기','B',165,'무교',4,2,'INFJ','010-2781-5392','fun468@naver.com',0),('Gahh','1278','Gahh',26,'남성','경기','A',177,'무교',3,1,'ISTP','010-6264-2571','hoha8388@naver.com',0),('gksthfqt','1276','한솔스',26,'남성','서울','AB',170,'무교',4,2,'ESTJ','010-6210-5972','wkdwogns95@naver.com',0),('gongthoissnoopy','1290','스누피주인',24,'남성','서울','A',177,'무교',3,2,'INFP','010-6842-5527','kwy5090@naver.com',0),('hamacojr','1268','포똥푸둥',24,'남성','서울','A',182,'무교',3,2,'ESFJ','010-5310-6897','hamacojr@gmail.com',0),('hansolasaraghae','1289','박한솔지인',26,'남성','경기','B',167,'기독교',3,1,'ESTP','010-1857-7495','wwr@naver.com',0),('hanxorbs3519','1286','한동우',26,'남성','서울','A',174,'무교',3,1,'ENTJ','010-7706-1622','hanxorbs3519@gmail.com',0),('hayeoniii','1303','하연',27,'여성','경기','A',161,'무교',4,2,'ISFJ','010-2512-7208','jhycarpediem@naver.com',0),('hmlee','1296','이혜민',25,'여성','강원','A',165,'무교',5,2,'ESTP','010-4597-9065','xcx@naver.com',0),('hong','1258','hong',30,'여성','서울','A',160,'무교',4,2,'ISTJ','010-2884-3658','adfe234@naver.com',0),('hong1','1234','홍길동',27,'남성','서울','O',180,'무교',1,2,NULL,'010-4244-1233','solo@naver.com',0),('hooong','1234','홍길동',26,'남성','서울','O',180,'기독교',5,1,NULL,'010-5542-4244','sss@naver.com',0),('j20','1293','전유민',23,'여성','경기','B',158,'무교',5,1,'ENFJ','010-9853-9016','asdf@naver.com',0),('jat','1269','잣',25,'남성','인천','B',180,'무교',4,1,'INFJ','010-1667-7012','a19@naver.com',3),('jean13579','1297','홍길동',25,'여성','경기','O',168,'천주교',4,1,'ESFP','010-2190-5336','jean13579@naver.com',0),('jerald96','1301','송정훈',25,'남성','경기','A',173,'기독교',1,2,'ESTP','010-8100-6441','ggf@naver.com',0),('jj33','1237','주연',26,'여성','경기','O',166,'무교',5,2,'ENTJ','010-7714-3154','aod1021@naver.com',0),('jupice3322','1248','유첨지',29,'남성','대전','O',170,'무교',5,2,'ISTP','010-6462-3275','a6@naver.com',0),('jyjin95','1238','1진',26,'여성','경기','O',168,'무교',3,2,'INFJ','010-7001-2699','jyjin955@naver.com',0),('kong22','1282','abc',26,'남성','서울','B',177,'기타',4,2,'ESFP','010-9970-3255','bombo95@naver.com',0),('Leiwy1818','1280','김창현',26,'남성','서울','O',173,'무교',5,2,'INTP','010-5619-3369','qwe@naver.com',0),('liqing9','1252','이청강',25,'여성','인천','A',160,'무교',4,2,'ESTP','010-9186-6099','liqing9@naver.com',0),('lo3ol','1300','이유림',26,'여성','경기','O',162,'천주교',3,2,'INFP','010-9330-8421','sdf@naver.com',0),('luckyboy','1243','장호재',33,'남성','서울','O',183,'무교',4,1,'INTJ','010-1743-1195','hjacc@naver.com',0),('magiclamp418','1259','임진희',23,'여성','인천','A',159,'무교',5,1,'ENTP','010-3416-9856','a12@naver.com',0),('Mangdi','1273','박민지',23,'여성','서울','O',77,'무교',4,1,'ENTJ','010-9575-3690','qkralswl4617@naver.com',0),('mck0819','1245','민찬기',29,'남성','경기','A',170,'무교',3,1,'ESTJ','010-8500-5554','mck0819@gmail.com',0),('minia0','1295','오앙',23,'여성','대전','O',159,'무교',4,2,'INFJ','010-7920-2903','bb@naver.com',0),('moonuhman','1267','문준혁',25,'남성','인천','AB',184,'무교',3,1,'ESTP','010-1663-6370','moonuhman@yonsei.ac.kr',0),('nanana08','1241','윤나경',24,'여성','서울','B',165,'기독교',4,2,'ESFJ','010-1174-5015','a3@naver.com',0),('noname','1255','익명',28,'남성','서울','O',185,'무교',2,2,'INFP','010-8163-5731','a9@naver.com',0),('ParkhansolLO','1240','박한솔로',26,'남성','인천','A',171,'기독교',4,2,'ESTP','010-5608-2961','dlwjdgus564@naver.com',0),('pengsu10','1263','펭수',24,'남성','서울','A',174,'무교',4,2,'ESFP','010-7696-9456','a15@naver.com',3),('qwe123','1246','큐더블류',28,'남성','인천','AB',173,'무교',3,2,'ISTP','010-7434-6333','a5@naver.com',2),('qwer1234','1272','이게 나야',26,'남성','경기','B',179,'무교',3,2,'ENTJ','010-8396-1210','a22@naver.com',1),('ROKMC','1305','무적해병',25,'남성','충북','O',170,'기독교',2,2,'ISFJ','010-5757-1833','asfe@naver.com',1),('root1004','1247','정길동',100,'여성','서울','AB',200,'무교',5,2,'INFJ','010-7692-3703','in12357',0),('s123','1256','공룡',26,'여성','서울','A',159,'무교',4,2,'ISTJ','010-4717-8490','carpe17diem@naver.com',0),('same4119','1302','미미',24,'여성','경기','B',162,'기타',4,1,'ENFJ','010-1743-6487','same4119@naver.com',0),('shllee1234','1250','이지원',25,'여성','경기','B',158,'무교',4,2,'INTP','010-8819-7053','shllee1234@naver.com',0),('sm7','1236','실버판테온',25,'남성','서울','B',185,'무교',1,2,'ENTJ','010-2773-1095','a2@naver.com',0),('smsp','1274','휘리릭',25,'여성','서울','A',157,'무교',5,1,'ISTP','010-1305-8662','a23@naver.com',0),('Sohi117','1304','한소희',25,'여성','강원','O',161,'무교',4,2,'ESTP','010-8077-5270','emily1107@naver.com',0),('Solsole','1242','솔한박',26,'남성','경기','A',163,'기독교',4,1,'INTP','010-1138-6565','a4@naver.com',0),('some','1234','썸',25,'남성','서울','A',178,'기독교',1,1,'INFP','01012345678','some@naver.com',2),('some2','1234','썸2',20,'여성','서울','A',160,'무교',4,2,'ENTJ','01012345678','some2@naver.com',0),('some3','1234','홍길동',25,'남성','서울','B',178,'기독교',3,2,'ESTP','01012345678','some3@naver.com',2),('SomeTaja','1249','썸맨',17,'남성','인천','O',177,'기독교',3,2,'INTJ','010-5819-9061',' Bigsdata@daum.net',0),('Spring3','1270','김춘삼',23,'여성','부산','O',164,'불교',5,1,'ENTJ','010-5821-1877','a20@naver.com',0),('ssoddong','1283','소똥',25,'여성','서울','A',167,'기독교',2,2,'ISTJ','010-4795-1290','maria9076@naver.com',0),('sta3589','1307','김영선',24,'여성','강원','A',160,'무교',5,2,'INFJ','010-6542-4392','vxv@naver.com',0),('Ujh','1260','Kyj',24,'남성','서울','O',173,'무교',3,1,'ENFJ','010-3454-2905','a13@naver.com',0),('vpdtnn','1285','공소연화이팅',24,'여성','강원','AB',171,'무교',3,2,'ISTJ','010-7960-4609','dfdf@naver.com',0),('WeAreTheWorld','1244','행벅벅스',30,'남성','경기','O',170,'기타',3,2,'ENTJ','010-2191-8295','rywok@yonsei.ac.kr',0),('wlsznzzz','1253','박진쿡',25,'남성','경기','B',175,'무교',4,2,'ISFP','010-2434-6834','skp417@naver.com',0),('Wodndwlsgk0630','1294','박진나',22,'여성','인천','O',162,'무교',5,2,'ESTP','010-6130-4088','wer@naver.com',0),('Woody','1257','우디',28,'여성','인천','O',162,'무교',4,2,'ISTP','010-4931-6074','a10@naver.com',0),('wpzjxn','1235','김지훈',26,'남성','경기','O',186,'무교',5,2,'ENTJ','010-9476-4324','wpzjxn@naver.com',0),('xiexie','1265','김정은',27,'남성','서울','A',178,'불교',4,1,'ISFP','010-7298-5734','a17@nvaer.com',0),('y197001','1292','우귀댕',22,'남성','서울','A',180,'천주교',3,2,'INFJ','010-1877-7383','dfaf@nvaer.com',0),('yjkr39','1306','이유림',24,'여성','강원','A',158,'무교',4,2,'ENFJ','010-5784-1335','dfdf@naver.com',0),('Zagzzz','1264','뿅',23,'여성','인천','O',160,'기독교',4,2,'INFP','010-3667-3869','a16@naver.com',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `sendid` varchar(100) DEFAULT NULL,
  `receiveid` varchar(100) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('123abc','some','안녕하세요'),('123abc','some','아'),('some','123abc','안녕하세요'),('123abc','some','안녕하세요'),('some3','123abc','안녕하세요'),('9a','y197001','안녕하세요'),('9a','some',NULL),('jat','dddds2','안녕하세요'),('dddds2','jat','네 안녕하세요 ^^'),('dddds2','some','안녕하세요~~~');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mit`
--

DROP TABLE IF EXISTS `mit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mit` (
  `id` varchar(100) NOT NULL,
  `itall` int(11) NOT NULL,
  `ireli` varchar(100) NOT NULL,
  `idrink` int(11) NOT NULL,
  `ismoke` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `mit_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mit`
--

LOCK TABLES `mit` WRITE;
/*!40000 ALTER TABLE `mit` DISABLE KEYS */;
INSERT INTO `mit` VALUES ('123abc',180,'기독교',3,2),('192160h',170,'상관없음',3,2),('2n',170,'무교',3,0),('9a',180,'상관없음',3,2),('abssjd15',180,'무교',2,2),('alfk00200',150,'상관없음',0,0),('asdf0331',180,'무교',4,0),('bigmama',170,'무교',4,0),('BLB19',160,'무교',4,2),('chaey9671',180,'상관없음',4,0),('Choi8',150,'무교',3,2),('dddds2',170,'무교',3,0),('dkdhsbsj',170,'상관없음',0,0),('edu',150,'무교',2,2),('educamp2016',0,'상관없음',4,2),('ehdgusd',150,'무교',0,1),('ehfapddl95',0,'무교',0,0),('fun468',170,'상관없음',4,2),('Gahh',150,'상관없음',3,0),('gksthfqt',150,'무교',4,2),('gongthoissnoopy',150,'상관없음',3,0),('hamacojr',0,'무교',3,2),('hansolasaraghae',150,'천주교',3,2),('hanxorbs3519',160,'상관없음',4,0),('hayeoniii',180,'상관없음',4,2),('hmlee',170,'상관없음',4,2),('hong',160,'무교',4,2),('hong1',150,'기독교',5,1),('hooong',150,'기독교',1,1),('j20',180,'무교',4,0),('jat',150,'상관없음',3,2),('jean13579',170,'상관없음',0,0),('jerald96',150,'기독교',2,2),('jj33',170,'상관없음',4,0),('jupice3322',150,'상관없음',4,2),('jyjin95',180,'상관없음',3,2),('kong22',150,'상관없음',4,2),('Leiwy1818',0,'상관없음',0,0),('liqing9',180,'무교',4,0),('lo3ol',170,'상관없음',3,0),('luckyboy',150,'상관없음',0,0),('magiclamp418',0,'상관없음',0,1),('Mangdi',180,'기타',4,0),('mck0819',150,'상관없음',4,0),('minia0',180,'무교',4,2),('moonuhman',160,'무교',3,0),('nanana08',170,'기독교',4,2),('noname',160,'상관없음',3,2),('ParkhansolLO',150,'상관없음',3,2),('pengsu10',160,'무교',4,2),('qwe123',160,'무교',3,2),('qwer1234',160,'상관없음',3,2),('ROKMC',0,'상관없음',3,2),('root1004',190,'상관없음',4,2),('s123',170,'상관없음',4,2),('same4119',180,'상관없음',4,0),('shllee1234',170,'무교',4,2),('sm7',0,'무교',3,2),('smsp',180,'무교',0,1),('Sohi117',170,'무교',4,2),('Solsole',150,'기독교',4,1),('some',150,'기독교',1,1),('some2',180,'상관없음',0,0),('some3',150,'기독교',0,2),('SomeTaja',160,'기독교',3,2),('Spring3',190,'천주교',5,1),('ssoddong',190,'상관없음',0,0),('sta3589',180,'상관없음',4,2),('Ujh',0,'상관없음',3,0),('vpdtnn',180,'무교',3,2),('WeAreTheWorld',150,'상관없음',3,2),('wlsznzzz',160,'무교',3,2),('Wodndwlsgk0630',170,'무교',3,2),('Woody',180,'상관없음',4,0),('wpzjxn',0,'상관없음',4,2),('xiexie',160,'무교',3,0),('y197001',160,'천주교',0,2),('yjkr39',170,'무교',4,2),('Zagzzz',170,'기독교',4,2);
/*!40000 ALTER TABLE `mit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` varchar(100) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `q5` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `question_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('123abc','찍먹','겨울','실내','전화','맥주'),('192160h','찍먹','여름','야외','카톡','소주'),('2n','부먹','여름','실내','전화','소주'),('9a','부먹','여름','야외','전화','소주'),('abssjd15','찍먹','겨울','실내','전화','소주'),('alfk00200','찍먹','여름','야외','전화','소주'),('asdf0331','찍먹','여름','실내','카톡','소주'),('bigmama','찍먹','여름','야외','카톡','맥주'),('BLB19','찍먹','여름','야외','카톡','맥주'),('chaey9671','찍먹','여름','실내','카톡','소주'),('Choi8','부먹','겨울','야외','카톡','맥주'),('dddds2','찍먹','겨울','실내','전화','소주'),('dkdhsbsj','찍먹','겨울','야외','카톡','소주'),('edu','찍먹','여름','야외','전화','맥주'),('educamp2016','찍먹','겨울','실내','카톡','소주'),('ehdgusd','부먹','겨울','실내','전화','소주'),('ehfapddl95','찍먹','겨울','실내','카톡','소주'),('fun468','찍먹','여름','야외','전화','맥주'),('Gahh','찍먹','겨울','야외','카톡','맥주'),('gksthfqt','찍먹','겨울','실내','카톡','맥주'),('gongthoissnoopy','찍먹','여름','실내','전화','소주'),('hamacojr','찍먹','여름','실내','카톡','맥주'),('hansolasaraghae','찍먹','겨울','야외','전화','맥주'),('hanxorbs3519','부먹','여름','실내','전화','맥주'),('hayeoniii','찍먹','여름','야외','전화','맥주'),('hmlee','찍먹','여름','실내','전화','소주'),('hong','찍먹','겨울','야외','전화','맥주'),('hong1','찍먹','겨울','실내','카톡','소주'),('hooong','부먹','여름','실내','카톡','소주'),('j20','찍먹','여름','실내','전화','맥주'),('jat','찍먹','겨울','실내','카톡','소주'),('jean13579','찍먹','겨울','야외','카톡','소주'),('jerald96','찍먹','겨울','야외','전화','맥주'),('jj33','찍먹','여름','실내','카톡','맥주'),('jupice3322','찍먹','겨울','실내','카톡','소주'),('jyjin95','찍먹','여름','야외','전화','맥주'),('kong22','찍먹','겨울','야외','전화','소주'),('Leiwy1818','부먹','겨울','야외','전화','맥주'),('liqing9','찍먹','여름','실내','카톡','소주'),('lo3ol','찍먹','겨울','야외','전화','맥주'),('luckyboy','부먹','겨울','실내','전화','소주'),('magiclamp418','찍먹','겨울','실내','전화','소주'),('Mangdi','찍먹','겨울','실내','카톡','소주'),('mck0819','찍먹','겨울','실내','전화','소주'),('minia0','찍먹','여름','야외','카톡','소주'),('moonuhman','찍먹','여름','실내','전화','소주'),('nanana08','부먹','여름','야외','카톡','소주'),('noname','찍먹','겨울','야외','카톡','맥주'),('ParkhansolLO','찍먹','겨울','야외','전화','맥주'),('pengsu10','찍먹','여름','야외','카톡','맥주'),('qwe123','부먹','겨울','실내','카톡','소주'),('qwer1234','부먹','여름','실내','카톡','소주'),('ROKMC','부먹','여름','야외','전화','맥주'),('root1004','부먹','여름','야외','카톡','맥주'),('s123','부먹','여름','야외','전화','맥주'),('same4119','찍먹','여름','실내','카톡','소주'),('shllee1234','찍먹','여름','야외','카톡','소주'),('sm7','찍먹','겨울','야외','전화','맥주'),('smsp','찍먹','겨울','야외','전화','소주'),('Sohi117','부먹','여름','야외','전화','소주'),('Solsole','찍먹','겨울','실내','전화','소주'),('some','부먹','여름','실내','카톡','소주'),('some2','찍먹','겨울','야외','전화','맥주'),('some3','부먹','겨울','야외','카톡','소주'),('SomeTaja','부먹','겨울','야외','전화','맥주'),('Spring3','부먹','여름','야외','전화','소주'),('ssoddong','부먹','여름','야외','전화','맥주'),('sta3589','찍먹','여름','실내','카톡','맥주'),('Ujh','부먹','겨울','실내','전화','맥주'),('vpdtnn','찍먹','여름','야외','전화','소주'),('WeAreTheWorld','찍먹','겨울','실내','전화','맥주'),('wlsznzzz','찍먹','겨울','야외','카톡','소주'),('Wodndwlsgk0630','찍먹','여름','실내','전화','소주'),('Woody','찍먹','여름','야외','전화','소주'),('wpzjxn','찍먹','여름','야외','전화','소주'),('xiexie','찍먹','겨울','야외','카톡','소주'),('y197001','부먹','겨울','야외','전화','소주'),('yjkr39','찍먹','여름','야외','카톡','맥주'),('Zagzzz','찍먹','겨울','실내','카톡','소주');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solve`
--

DROP TABLE IF EXISTS `solve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solve` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `gender` varchar(100) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `a1` varchar(100) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `a2` varchar(100) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `a3` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `solve_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solve`
--

LOCK TABLES `solve` WRITE;
/*!40000 ALTER TABLE `solve` DISABLE KEYS */;
INSERT INTO `solve` VALUES ('123abc','여성','애인이 삐졌을 때','애교를 시전하여 풀어준다','좋아하는 음악 스타일','감미롭고 서정적인 발라드','이성의 어떤 향기에 끌리나요?','체취와 섞여 매력적인 향수 향기'),('192160h','여성','나의 연애 성향은?','맞춰주고 배려를 아끼지 않는 스타일','나는 OO 취향이 맞는것에 가장 끌려요','쿵짝! 대화코드','여행지에서 나는 어떤 스타일?','스포츠를 즐기는 액티브형'),('2n','여성','애인의 과거! 난 이렇게 한다','과거는 과거일뿐 신경쓰지 않는다','내가 원하는 데이트 빈도는?','주 1회','카페에서 어떤 음료를 즐기나요?','쌉쌀한 맛이 일품인 아메리카노'),('9a','여성','애인이 몸이 아플 때','푹 쉴 수 있게 냅둬주기 ','하루에 연락은 얼마나?','틈틈이 톡해주는게 좋아요','좋아하는 영화 취향','긴장감 있는 반전 스릴러'),('asdf0331','여성','찬바람 쌩쌩 부는 어느 추운 겨울날','장갑 한쪽씩 나눠끼고 손 꼭 잡아주기','나의 연애 성향은?','맞춰주고 배려를 아끼지 않는 스타일','내가 활동하기 좋아하는 시간은?','엔돌핀이 분비되는 오후형'),('bigmama','남성','애인이 몸이 아플 때','푹 쉴 수 있게 냅둬주기 ','애인의 과거! 난 이렇게 한다','과거는 과거일뿐 신경쓰지 않는다','나는 OO 취향이 맞는것에 가장 끌려요','음식/기호식품 취향'),('dddds2','여성','애인이 삐졌을 때','애교를 시전하여 풀어준다','하루에 연락은 얼마나?','틈틈이 톡해주는게 좋아요','좋아하는 음악 스타일','일렉트로닉, 힙합 비트'),('edu','남성','애인의 과거! 난 이렇게 한다','직접 물어본다','나는 OO 취향이 맞는것에 가장 끌려요','음식/기호식품 취향','내가 활동하기 좋아하는 시간은?','일찍 일어나는게 더 쉬운 아침형'),('gksthfqt','남성','애인이 삐졌을 때','집 앞에 찾아가 깜작 이벤트를 해준다','내가 원하는 데이트 빈도는?','주 2~3회','운동을 얼마나 하세요?','매일 규칙적으로'),('some','남성','애인이 폰을 보고 싶어할 때','너도 폰 줘봐, 조건부로 공개','하루에 연락은 얼마나?','잦은 톡보다는 전화가 좋아요','운동을 얼마나 하세요?','only 숨쉬기 운동'),('some3','남성','애인이 폰을 보고 싶어할 때','정답을 선택해주세요','연인과의 다툼에서 나는 어떤 스타일?','생각할 시간을 갖고 이야기한다','좋아하는 음악 스타일','감미롭고 서정적인 발라드');
/*!40000 ALTER TABLE `solve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'someproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 14:58:25
