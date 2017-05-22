alter session set "_ORACLE_SCRIPT"=true;

CREATE ROLE roleTRUONGPHONG;
grant roleTRUONGPHONG to TP001;
grant roleTRUONGPHONG to TP002;
grant roleTRUONGPHONG to TP003;
grant roleTRUONGPHONG to TP004;
grant roleTRUONGPHONG to TP005;

grant create session to roleTRUONGPHONG;

CREATE ROLE roleTRUONGDA;
grant roleTRUONGDA to TDA001;
grant roleTRUONGDA to TDA002;
grant roleTRUONGDA to TDA003;
grant roleTRUONGDA to TDA004;
grant roleTRUONGDA to TDA005;

grant create session to roleTRUONGDA;

CREATE ROLE roleTRUONGCN;
grant roleTRUONGCN to TCN001;
grant roleTRUONGCN to TCN002;
grant roleTRUONGCN to TCN003;
grant roleTRUONGCN to TCN004;
grant roleTRUONGCN to TCN005;

grant create session to roleTRUONGCN;


CREATE ROLE roleGIAMDOC;
grant roleGIAMDOC to GD001;
grant roleGIAMDOC to GD002;
grant roleGIAMDOC to GD003;
grant roleGIAMDOC to GD004;
grant roleGIAMDOC to GD005;

grant create session to roleGIAMDOC;

CREATE ROLE roleNHANVIEN;
grant roleNHANVIEN to NV001;
grant roleNHANVIEN to NV002;
grant roleNHANVIEN to NV003;
grant roleNHANVIEN to NV004;
grant roleNHANVIEN to NV005;

grant create session to roleNHANVIEN;