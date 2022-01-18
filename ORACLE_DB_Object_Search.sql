-- created by LazyDaddy

-- Oracle DB object search - procedure, function

SELECT
         ao.*
FROM ALL_OBJECTS ao
WHERE AO.OWNER IN ('OWNER1', 'OWNER2', 'OWNER3', 'OWNER3') -- 검색 대상 OWNER 입력
  AND AO.OBJECT_TYPE IN ('PROCEDURE', 'FUNCTION')
  AND (:v_searchWord1 IS NULL
       OR EXISTS (SELECT *
                  FROM ALL_SOURCE aa
                  WHERE AA.OWNER = AO.OWNER AND AA.NAME = AO.OBJECT_NAME AND UPPER (AA.TEXT) LIKE '%' || UPPER(:v_searchWord1) || '%' ESCAPE '\'))
  AND (:v_searchWord2 IS NULL
       OR EXISTS (SELECT *
                  FROM ALL_SOURCE aa
                  WHERE AA.OWNER = AO.OWNER AND AA.NAME = AO.OBJECT_NAME AND UPPER (AA.TEXT) LIKE '%' || UPPER(:v_searchWord2) || '%' ESCAPE '\'))
  AND (:v_searchWord3 IS NULL
       OR EXISTS (SELECT *
                  FROM ALL_SOURCE aa
                  WHERE AA.OWNER = AO.OWNER AND AA.NAME = AO.OBJECT_NAME AND UPPER (AA.TEXT) LIKE '%' || UPPER(:v_searchWord3) || '%' ESCAPE '\'))
  AND (:v_owner IS NULL OR AO.OWNER = :v_owner);