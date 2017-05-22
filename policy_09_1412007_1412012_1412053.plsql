--**************************************************************
--** T?o policy truy xu?t vào b?ng d? án					            **
--** policy_name: Access_DuAn							                    **
--** column_name: OLS_DuAn									                  **
--**************************************************************
begin
sa_sysdba.create_policy (
  policy_name => 'Access_DuAn',
  column_name => 'OLS_DuAn');
end;

--**************************************************************
--** C?p role qu?n tr? cho policy Access_DuAn				          **
--** user: QLDA	(Qu?n l? d? án)								                **
--**************************************************************
--Gán role Access_DuAn_dba cho tài kho?n 
grant Access_DuAn_dba to QLDA;

-- START: C?p quy?n th?c thi trên các hàm dùng khi qu?n l? label
-- Quy?n s? d?ng các hàm qu?n l? label, compartment, group
grant execute on sa_components to QLDA;

-- Quy?n t?o các label
grant execute on sa_label_admin to QLDA;

-- Quy?n gán policy cho b?ng
grant execute on sa_policy_admin to QLDA;

-- Quy?n gán label cho tài kho?n
grant execute on sa_user_admin to QLDA;

-- Chuy?n chu?i thành s? c?a label
grant execute on char_to_label to QLDA;
-- END: C?p quy?n th?c thi trên các hàm dùng khi qu?n l? label




--**************************************************************
--** T?o label				  								                      **
--** Level: Thông thý?ng, TT, 1							                  **
--** 		Gi?i h?n, GH, 2						  			                    **
--**        Bí m?t, BM, 3							  		                  **
--** 		Bí m?t cao, BMC, 4							                      **
--** Group: T?ng công ty, TCT, 400							              **
--** 		Hà N?i, HN, 300, TCT						  	                  **
--** 		H? Chí Minh, HCM, 200, HN						                  **
--**        Ðà N?ng, DN, 100							  	                **
--** COMPARTMENT: Nhân s?, NS, 30							                **
--** 			  K? toán, KT, 20						  	                    **
--** 			  K? ho?ch, KH, 10   						                    **
--**************************************************************
-- T?o level
BEGIN
sa_components.create_level(
  policy_name => 'Access_DuAn',
  long_name => 'Thong thuong',
  short_name => 'TT',
  level_num => 1
);
END;

BEGIN
sa_components.create_level(
  policy_name => 'Access_DuAn',
  long_name => 'Gioi han',
  short_name => 'GH',
  level_num => 2
);
END;

BEGIN
sa_components.create_level(
  policy_name => 'Access_DuAn',
  long_name => 'Bi mat',
  short_name => 'BM',
  level_num => 3
);
END;

BEGIN
sa_components.create_level(
  policy_name => 'Access_DuAn',
  long_name => 'Bi mat cao',
  short_name => 'BMC',
  level_num => 4
);
END;

--T?o group
BEGIN
sa_components.create_group(
  policy_name => 'Access_DuAn',
  long_name => 'Tong cong ty',
  short_name => 'TCT',
  group_num => 400,
  parent_name => NULL);
END;

BEGIN
sa_components.create_group(
  policy_name => 'Access_DuAn',
  long_name => 'Ha Noi',
  short_name => 'HN',
  group_num => 300,
  parent_name => 'TCT');
END;

BEGIN
sa_components.create_group(
  policy_name => 'Access_DuAn',
  long_name => 'TP Ho Chi Minh',
  short_name => 'HCM',
  group_num => 200,
  parent_name => 'HN');
END;

BEGIN
sa_components.create_group(
  policy_name => 'Access_DuAn',
  long_name => 'Da Nang',
  short_name => 'DN',
  group_num => 100,
  parent_name => 'HN');
END;

--T?o compartment
BEGIN
sa_components.create_compartment(
  policy_name => 'Access_DuAn',
  comp_num => 30,
  long_name => 'Nhan su',
  short_name => 'NS'  
);
END;

BEGIN
sa_components.create_compartment(
  policy_name => 'Access_DuAn',
  comp_num => 20,
  long_name => 'Ke toan',
  short_name => 'KT'  
);
END;

BEGIN
sa_components.create_compartment(
  policy_name => 'Access_DuAn',
  comp_num => 10,
  long_name => 'Ke hoach',
  short_name => 'KH'  
);
END;

--T?o nh?n
BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 120,
  label_value => 'BMC:NS:TCT'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 110,
  label_value => 'BMC:KT:TCT'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 100,
  label_value => 'BMC:KH:TCT'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 90,
  label_value => 'BMC:NS:HN'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 80,
  label_value => 'BMC:KT:HN'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 70,
  label_value => 'BMC:KH:HN'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 60,
  label_value => 'BMC:NS:HCM'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 50,
  label_value => 'BMC:KT:HCM'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 40,
  label_value => 'BMC:KH:HCM'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 30,
  label_value => 'BMC:NS:DN'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 20,
  label_value => 'BMC:KT:DN'
);
END;

BEGIN
sa_label_admin.create_label(
  policy_name => 'ACCESS_DuAn',
  label_tag => 10,
  label_value => 'BMC:KH:DN'
);
END;

--**************************************************************
--** Gán policy cho b?ng	  						  		                **
--**************************************************************
BEGIN
sa_policy_admin.apply_table_policy(
  policy_name => 'ACCESS_DuAn',
  schema_name => 'dbaDuAn',
  table_name => 'duan',
  table_options => 'NO_CONTROL'
);
END;

--**************************************************************
--** Gán nh?n cho d? li?u	  						  		                **
--**************************************************************
UPDATE dbaDuAn.duan SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:NS:HN');
UPDATE dbaDuAn.duan SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:KT:HN');
UPDATE dbaDuAn.duan SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:KH:HN');

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:KH:HCM') 
WHERE MADA = 'DA001';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:KH:HCM')
WHERE MADA = 'DA001';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:KH:HCM')
WHERE MADA = 'DA001';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:KH:DN') 
WHERE MADA = 'DA003';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:KH:DN')
WHERE MADA = 'DA003';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'BMC:KH:DN')
WHERE MADA = 'DA003';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'TT:KH:HCM')
WHERE MADA = 'DA001';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'TT:KH:HCM')
WHERE MADA = 'DA001';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'TT:KH:HN') 
WHERE MADA = 'DA002';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'TT:KH:HN')
WHERE MADA = 'DA002';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'TT:KH:HN')
WHERE MADA = 'DA003';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'TT:KH:DN') 
WHERE MADA = 'DA003';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'TT:KH:DN')
WHERE MADA = 'DA003';

UPDATE dbaDuAn.duan 
SET OLS_DuAn = char_to_label('ACCESS_DuAn', 'TT:KH:DN')
WHERE MADA = 'DA003';
--**************************************************************
--** Gán lebel cho tài kho?n	  						  		            **
--**************************************************************

BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_DuAn',
user_name => 'TCN002',
max_read_label => 'BMC:NS,KT,KH:TCT',
max_write_label => 'BMC:NS,KT,KH:HN',
min_write_label => 'TT',
def_label => 'BMC:NS,KT,KH:TCT',
row_label => 'BMC:NS,KT,KH:TCT');
END;



