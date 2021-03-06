alter session set "_ORACLE_SCRIPT"=true;

CREATE VIEW viewNHANVIEN
AS
  SELECT *
  FROM dbaDuAn.NHANVIEN;
  
CREATE OR REPLACE FUNCTION funcNHANVIEN (obj_schema varchar2, obj_name varchar2)
RETURN varchar2 IS
  user varchar2 (20);
  BEGIN
    user := SYS_CONTEXT ('userenv', 'SESSION_USER');
    RETURN 'maNV = ' || '''' || user || '''';
    --return '';
  END;

BEGIN DBMS_RLS.ADD_POLICY (
  object_schema => 'dbaDuAn',
  object_name =>   'viewNHANVIEN',
  policy_name =>   'policy_6_1412007',
  function_schema => 'dbaDuAn',
  policy_function => 'funcNHANVIEN',
  sec_relevant_cols => 'luong',
  sec_relevant_cols_opt => dbms_rls.ALL_ROWS);
END;
  
CREATE OR REPLACE FUNCTION funcNHANVIEN1 (obj_schema varchar2, obj_name varchar2)
RETURN varchar2 IS
  f_maPhong dbaDuAn.PHONGBAN.maPhong%type;
  user varchar2 (20);
  BEGIN
    user := SYS_CONTEXT ('userenv', 'SESSION_USER');
    SELECT maPhong INTO f_maPhong FROM dbaDuAn.NHANVIEN WHERE maNV = user;
    RETURN 'maPhong = ' || '''' || f_maPhong || '''';
    --return '';
  END;

BEGIN DBMS_RLS.ADD_POLICY (
  object_schema => 'dbaDuAn',
  object_name =>   'viewNHANVIEN',
  policy_name =>   'policy_6_1412007_2',
  function_schema => 'dbaDuAn',
  policy_function => 'funcNHANVIEN1',
  statement_types => 'select');
END;

--TAO SYNONYM CHO NV, TP, TDA, TCN
CREATE SYNONYM NV001.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV002.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV003.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV004.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV005.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV006.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV007.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV008.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV009.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;
CREATE SYNONYM NV010.viewNHANVIEN FOR dbaDuAn.viewNHANVIEN;

CREATE SYNONYM TP001.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TP002.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TP003.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TP004.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TP005.NHANVIEN FOR dbaDuAn.NHANVIEN;

CREATE SYNONYM TDA001.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TDA002.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TDA003.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TDA004.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TDA005.NHANVIEN FOR dbaDuAn.NHANVIEN;

CREATE SYNONYM TCN001.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TCN002.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TCN003.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TCN004.NHANVIEN FOR dbaDuAn.NHANVIEN;
CREATE SYNONYM TCN005.NHANVIEN FOR dbaDuAn.NHANVIEN;

--GAN QUYEN CHO NV
GRANT SELECT ON viewNhanVien TO NV001;
GRANT SELECT ON viewNhanVien TO NV002;
GRANT SELECT ON viewNhanVien TO NV003;
GRANT SELECT ON viewNhanVien TO NV004;
GRANT SELECT ON viewNhanVien TO NV005;
GRANT SELECT ON viewNhanVien TO NV006;
GRANT SELECT ON viewNhanVien TO NV007;
GRANT SELECT ON viewNhanVien TO NV008;
GRANT SELECT ON viewNhanVien TO NV009;
GRANT SELECT ON viewNhanVien TO NV010;

--TRUONG PHONG
GRANT SELECT ON NhanVien TO TP001;
GRANT SELECT ON NhanVien TO TP002;
GRANT SELECT ON NhanVien TO TP003;
GRANT SELECT ON NhanVien TO TP004;
GRANT SELECT ON NhanVien TO TP005;

--TRUONG DU AN
GRANT SELECT ON NhanVien TO TDA001;
GRANT SELECT ON NhanVien TO TDA002;
GRANT SELECT ON NhanVien TO TDA003;
GRANT SELECT ON NhanVien TO TDA004;
GRANT SELECT ON NhanVien TO TDA005;

--TRUONG CHI NHANH
GRANT SELECT ON NhanVien TO TCN001;
GRANT SELECT ON NhanVien TO TCN002;
GRANT SELECT ON NhanVien TO TCN003;
GRANT SELECT ON NhanVien TO TCN004;
GRANT SELECT ON NhanVien TO TCN005;