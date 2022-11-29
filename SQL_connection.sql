create database LanguageDataBase;

CREATE table TranslationTable(TranslateID int,MainSentence nvarchar(500),Translation nvarchar(500)); //Translational Table starts from here
INSERT into  TranslationTable VALUES(1,'how are you','aap kaysay hoo');
INSERT into  TranslationTable VALUES(2,'where are you','aap kahaa hoo');
INSERT into  TranslationTable VALUES(3,'when are you comming','aap kab aa rahay hoo');

UPDATE  TranslationTable  
set TranslationTable.Translation='تؤحي چؤ ٹي كح'
WHERE TranslationTable.TranslateID=1;

SELECT * FROM TranslationTable WHERE TranslationTable.TranslateID=1;
--drop table LanguageDataBase.dbo.TranslationTable

drop TABLE TranslationTable
