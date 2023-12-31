CREATE PACKAGE HIPACKAGE AS 
FUNCTION HEATINDEX(
        TMP NUMBER,
        RH NUMBER
    )
    RETURN NUMBER;
FUNCTION CTOF(
        TMP NUMBER
    )
    RETURN NUMBER;
PROCEDURE ROLLUPHOURSHI(
    STATION NUMBER,
    TARGET_DAY VARCHAR2
);
END HIPACKAGE;
/
CREATE PACKAGE BODY HIPACKAGE AS 
    FUNCTION HEATINDEX(
        TMP NUMBER,
        RH NUMBER
    )
    RETURN NUMBER
    IS
        HI NUMBER;
    BEGIN
        HI := -42.379 + 2.04901523*TMP + 10.14333127*RH - 0.22475541*TMP*RH - 0.00683783*TMP*TMP - .05481717*RH*RH + 0.00122874*TMP*TMP*RH + 0.00085282*TMP*RH*RH - 0.00000199*TMP*TMP*RH*RH;
        IF HI < 80 THEN
        HI := 0.5 * (TMP + 61.0 + ((TMP-68.0)*1.2) + (RH*0.094));
        END IF;
        RETURN HI;
    END;
    FUNCTION CTOF(
        TMP NUMBER
    )
    RETURN NUMBER
    IS
        RETTMP NUMBER;
    BEGIN
        RETTMP := TMP*1.8 + 32;
        RETURN RETTMP;
    END;
    PROCEDURE ROLLUPHOURSHI (
        STATION NUMBER,
        TARGET_DAY VARCHAR2
    )
    IS 
    BEGIN
        INSERT INTO HOURLY_HEAT_INDEX
        (
            SELECT WBANNO, CONCAT(UTC_DATE, SUBSTR(UTC_TIME,1, 2)) AS "DATE_TIME" , HEATINDEX(CTOF(AVG(AIR_TEMPERATURE)), AVG(RELATIVE_HUMIDITY)) AS "HEAT_INDEX" 
            FROM USCRN_DATA
            WHERE WBANNO = STATION AND UTC_DATE = TARGET_DAY
            GROUP BY CONCAT(UTC_DATE, SUBSTR(UTC_TIME,1, 2)), WBANNO
        );
    END;
END HIPACKAGE;
/
