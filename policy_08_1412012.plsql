ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE OR REPLACE FUNCTION funcCHITIEU
(obj_schema varchar2, obj_name varchar2)
RETURN varchar2
IS
  user varchar2(20);
BEGIN
  user := SYS_CONTEXT ('USERENV', 'SESSION_USER');
  RETURN 'DUAN IN (SELECT MADA 
        FROM dbaDuAn.DUAN, dbaDuAn.PHONGBAN 
        WHERE TRUONGPHONG = ' || '''' || user || '''' || 'AND DUAN.PHONGCHUTRI = PHONGBAN.MAPHONG)';
END;

BEGIN 
DBMS_RLS.ADD_POLICY(
  object_schema => 'dbaDuAn',
  object_name => 'CHITIEU',
  policy_name => 'policy_8_1412012',
  function_schema => 'dbaDuAn',
  policy_function => 'funcCHITIEU',
  sec_relevant_cols => 'soTien',
  sec_relevant_cols_opt => dbms_rls.ALL_ROWS);
END;

GRANT SELECT ON CHITIEU TO ROLETRUONGPHONG;
