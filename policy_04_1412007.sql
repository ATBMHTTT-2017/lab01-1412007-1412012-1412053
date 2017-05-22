CREATE VIEW viewGIAMDOC AS
SELECT DA.mada, DA.tenda, DA.kinhphi, PB.tenphong, CN.tencn, NV.hoten, sum(CT.soTien) as tongchi
FROM dbaDuAn.duan DA, dbaDuAn.nhanvien NV, dbaDuAn.phongban PB, dbaDuAn.chinhanh CN, dbaDuAn.chitieu CT
WHERE DA.phongchutri = PB.maphong
      AND PB.chinhanh = CN.macn
      AND DA.truongda = NV.manv
GROUP BY DA.maDA, DA.tenDA, DA.kinhPhi, PB.tenPhong, CN.tenCN, NV.hoTen;
      
CREATE SYNONYM GD001.viewGIAMDOC FOR dbaDuAn.viewGIAMDOC;
CREATE SYNONYM GD002.viewGIAMDOC FOR dbaDuAn.viewGIAMDOC;
CREATE SYNONYM GD003.viewGIAMDOC FOR dbaDuAn.viewGIAMDOC;
CREATE SYNONYM GD004.viewGIAMDOC FOR dbaDuAn.viewGIAMDOC;
CREATE SYNONYM GD005.viewGIAMDOC FOR dbaDuAn.viewGIAMDOC;

GRANT SELECT ON viewGIAMDOC TO GD001;
GRANT SELECT ON viewGIAMDOC TO GD002;
GRANT SELECT ON viewGIAMDOC TO GD003;
GRANT SELECT ON viewGIAMDOC TO GD004;
GRANT SELECT ON viewGIAMDOC TO GD005;
