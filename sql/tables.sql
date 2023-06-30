CREATE TABLE uscrn_data (
    WBANNO NUMBER,
    UTC_DATE VARCHAR2(8),
    UTC_TIME VARCHAR2(4),
    LST_DATE VARCHAR2(8),
    LST_TIME VARCHAR2(4),
    CRX_VN VARCHAR2(10),
    LONGITUDE NUMBER,
    LATITUDE NUMBER,
    AIR_TEMPERATURE NUMBER,
    PRECIPITATION NUMBER,
    SOLAR_RADIATION NUMBER,
    SR_FLAG VARCHAR2(1),
    SURFACE_TEMPERATURE NUMBER,
    ST_TYPE VARCHAR2(2),
    ST_FLAG VARCHAR2(1),
    RELATIVE_HUMIDITY NUMBER,
    RH_FLAG VARCHAR2(1),
    SOIL_MOISTURE_5 NUMBER,
    SOIL_TEMPERATURE_5 NUMBER,
    WETNESS NUMBER,
    WET_FLAG VARCHAR2(1),
    WIND_1_5 NUMBER,
    WIND_FLAG  VARCHAR2(1)
);
CREATE TABLE hourly_heat_index (
    WBANNO NUMBER,
    DATE_TIME VARCHAR2(12),
    HEAT_INDEX NUMBER
);

