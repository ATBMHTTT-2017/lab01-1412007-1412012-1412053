SET SERVEROUTPUT ON;
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE OR REPLACE PROCEDURE capNhatPhongBan
(p_maPhong varchar2, p_tenPhong nvarchar2, p_truongPhong varchar2,
  p_ngayNhanChuc date,
  p_soNhanVien smallint,
  p_chiNhanh varchar2)
IS
  v_hopLe boolean;
  l_exst number(1);
BEGIN
  v_hopLe := FALSE;
  IF p_maPhong IS NOT NULL THEN
    SELECT CASE
        WHEN EXISTS ( SELECT maPhong
                      FROM dbaDuAn.PhongBan
                      WHERE maPhong = p_maPhong)
        THEN 1
        ELSE 0
      END INTO l_exst
    FROM DUAL;
  IF l_exst = 1
    THEN
      UPDATE dbaDuAn.PhongBan
      SET tenPhong = p_tenPhong,
          truongPhong = p_truongPhong,
          ngayNhanChuc = p_ngayNhanChuc,
          soNhanVien = p_soNhanVien,
          chiNhanh = p_chiNhanh
      WHERE maPhong = p_maPhong;
      v_hopLe := TRUE;
    END IF;
  END IF;
  IF v_hopLe THEN
    dbms_output.put_line('Cap nhat thanh cong');
  ELSE
    dbms_output.put_line('Ma phong khong hop le');
  END IF;
END;
GRANT EXECUTE ON CAPNHATPHONGBAN TO ROLETRUONGPHONG;
GRANT EXECUTE ON CAPNHATPHONGBAN TO ROLETRUONGCN;