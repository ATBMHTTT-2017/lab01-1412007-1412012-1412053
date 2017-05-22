alter session set "_ORACLE_SCRIPT"=true;

create or replace function funcTRUONGDA_chitieu (p_schema varchar2, p_obj varchar2)
return varchar2
as
  user varchar2 (20);
begin
    user := SYS_CONTEXT ('userenv', 'SESSION_USER');
    if (user = 'TDA001' or user = 'TDA002' or user = 'TDA003' or user = 'TDA004' or user = 'TDA005') then
      return 'dbaDuAn.chitieu.duan in (select dbaDuAn.duan.mada from dbaDuAn.duan where dbaDuAn.duan.truongda = ' || '''' || user || ''')';
    else
      return '';
    end if;
end;

begin dbms_rls.add_policy(
  object_schema => 'dbaDuAn',
  object_name => 'chitieu',
  policy_name => 'cau7_1412053',
  function_schema => 'dbaDuAn',
  policy_function => 'funcTRUONGDA_chitieu',
  statement_types => 'select, insert, update, delete',
  update_check => true);
end;

GRANT select, insert on dbaDuAn.ChiTieu TO TDA001;
GRANT select, insert on dbaDuAn.ChiTieu TO TDA002;
GRANT select, insert on dbaDuAn.ChiTieu TO TDA003;
GRANT select, insert on dbaDuAn.ChiTieu TO TDA004;
GRANT select, insert on dbaDuAn.ChiTieu TO TDA005;
