select 
  lpad(chr(code), (ascii('Z')-code) + 1,' ')||lpad(chr(code), 2*(code-65),' ')  
from
(
select code from (select level as code from dual connect by level<=90) where code >= 65 
union all
select code from (select level as code from dual connect by level<=(ascii('Z')-1) order by 1 desc ) where code >= 65
) where code <= ascii('Z')
/
